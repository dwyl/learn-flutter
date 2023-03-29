<div align="center">

# Making your `Flutter Web` loading times faster ⚡️

This doc will guide you 
to speeding up your release bundle loading times
for deployment. 

This "hack" was discovered by 
[**`@harryfei`**](https://github.com/harryfei)
and shared in 
[dwyl/app/issues/326](https://github.com/dwyl/app/issues/326#issuecomment-1478314967)

</div>

- [Making your `Flutter Web` loading times faster ⚡️](#making-your-flutter-web-loading-times-faster-️)
- [Pre-requisites 📝](#pre-requisites-)
- [Creating the release bundle 🧱](#creating-the-release-bundle-)
- [Inspecting the `build` folder and patching `flutter.js` 🔍](#inspecting-the-build-folder-and-patching-flutterjs-)
- [Patching `flutter_service_worker.js` 🔍](#patching-flutter_service_workerjs-)
- [Changing the `index.html` file to register service worker earlier 🏃‍♂️](#changing-the-indexhtml-file-to-register-service-worker-earlier-️)
- [Integrating into Github Actions ✨](#integrating-into-github-actions-)
- [tl;dr](#tldr)


# Pre-requisites 📝

This guide assumes you've read
the [`deployment.md`](../deployment.md) document.

If you are curious to see a project
using these changes,
do visit [`dwyl/app`](https://github.com/dwyl/app).


# Creating the release bundle 🧱

This "speed hack" essentially makes changes
to the generated output
so resources needed to run the `Flutter Web App`
are *downloaded in parallel*.

Assuming you already have a project,
you first need to build it.

```sh
flutter build web --release --web-renderer html
```

> **Note**
>
> In our [`app`](https://github.com/dwyl/app),
> we are using an `html` web renderer.
> If you're curious about knowing about the difference
> between using an `html` or `canvaskit` web renderer,
> visit https://github.com/dwyl/flutter-phoenix-channels-demo#61-switching-between-the-html-and-canvaskit-web-renderers.
>
> If you are using `canvaskit` instead of `html`,
> you will need to make a small change for our "hack" to work correctly.
> Don't worry, we'll tell you when 🙂.

After running this command,
you will see a newly created `build` folder.


# Inspecting the `build` folder and patching `flutter.js` 🔍

If you inspect the `build` folder,
you will see that a `flutter.js` file was created.
This `Javascript` file is downloaded to the browser
and tells it how to download the `Flutter` engine to run the `Flutter Web App`
and the necessary resources to do so.

We will focus on the **`flutter.js`** file 
and make changes to it.
Since we want to change this build file
before being deployed,
we are making changes to it
by [**patching**](https://www.tutorialspoint.com/unix_commands/patch.htm) it.

Locate the `async loadEntrypoint(options)` function
at the end of the file.
Find the very last line of the function
and change it to the following.

```js
const main = entrypointLoader.loadEntrypoint(entrypoint);
  
fetch("assets/FontManifest.json");
fetch("assets/fonts/MaterialIcons-Regular.otf");
fetch("assets/packages/cupertino_icons/assets/CupertinoIcons.ttf");
fetch("/");

return main;
```

We are now fetching the needed assets **concurrently**
and prior to loading the `Flutter` engine.
This will save us some valuable milliseconds!

> **Note**
>
> If you are using the `canvaskit` web renderer,
> you need to add the following lines
> alongside the other fetches.
>
> ```js
> fetch("canvaskit/canvaskit.js");
> fetch("canvaskit/canvaskit.wasm");
> ```

Your changes should look like the following.

[`flutter.js`](https://github.com/dwyl/learn-flutter/pull/84/commits/69347403f53594b041064e805dcbffe023952361)

Now let's create our patch files.
If you create two different files,
one with the code *before the changes*
and the other *after the changes*,
you can create a **patch file**
that will detail these modifications.

Simply run:

```sh
diff -u old.js new.js > file.js.patch
```

This will create our `patch` file with the changes!
We will need it later on!

Your `flutter.js` patch file should look something like this!

[`flutter.js.patch`](https://github.com/dwyl/learn-flutter/blob/de89d83bea972dbe5a13cd9ae8f0a6e34840e5a8/guides/flutter-web-speed-boost/flutter.js.patch)


# Patching `flutter_service_worker.js` 🔍

The other file we need to work on is `flutter_service_worker.js`.
When loading up the `Flutter` engine and executing our app,
`Flutter` will install a 
[service worker](https://web.dev/learn/pwa/service-workers/) in your browser.

`flutter_service_worker.js` is the configuration file of the service worker.
It originally downloaded the files we specified earlier in `flutter.js`
after the engine was properly loaded into the browser.
Now we need to skip these files, as we already fetched them prior.

You can check
the needed changes to the file
in the following commit.

[`flutter_service_worker.js`](https://github.com/dwyl/learn-flutter/pull/84/commits/b1edc58de99014f7423fdc9c08f207ec611b6439)

You can create the patch file in the same fashion as before.
It should look like the following.

[`flutter_service_worker.js.patch`](https://github.com/dwyl/learn-flutter/blob/de89d83bea972dbe5a13cd9ae8f0a6e34840e5a8/guides/flutter-web-speed-boost/flutter_service_worker.js.patch)


# Changing the `index.html` file to register service worker earlier 🏃‍♂️

We now need to change the `web/index.html` file
so it registers the service worker earlier than before.
Doing this is quite simple, fortunately!

Just add the following line 
at the end of the `<script>` inside the file!

```js
const serviceWorkerActivation = navigator.serviceWorker.register(
    "flutter_service_worker.js?v=" + serviceWorkerVersion
);
```

This will register the service worker
when the `index.html` loads.


# Integrating into Github Actions ✨

To integrate this as a step into a Github Action
or any other CI pipeline,
we need to create a script 
that will *run the patch files* after building the folder.

Let's create a folder called `build_tools`
on the root of our project.
Inside of it, we will create a folder called `web`
where we will place the `.patch` folders we've created.
Inside `build_tools` folder,
add the following script called `patch_web.sh`.

```sh
#!/usr/bin/env sh

set -e

patch ./build/web/flutter.js < ./build_tools/web/flutter.js.patch
patch ./build/web/flutter_service_worker.js < ./build_tools/web/flutter_service_worker.js.patch
```

This script will essentially run the patch files
over the generated `build` files.

In your 
[Github Action `yaml` configuration file](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions),
you can execute the script after building the files.

```yaml
- name: Create release build
    run: flutter build web --release --web-renderer html

- name: Run post-build script to download files concurrently
    run: | 
        chmod +x ./build_tools/patch_web.sh
        sh ./build_tools/patch_web.sh --ignore-whitespace
```

And you're done!
The changed `build` files
should then be deployed
and you will notice an increase on the loading time.
We've registered a `200ms` increase!


# tl;dr 

If you just want the code,
please check the PR we made to our `app`
at https://github.com/dwyl/app/pull/330/files.

All the code you need to change lives there.
You can re-use it to your heart's content! 
