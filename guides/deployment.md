<div align="center">

# Deploying your Flutter app as a `PWA` 👩‍💻 

This is a small guide
that will guide you 
to deploy your `Flutter` app
into the web.
We are going to be deploying the app 
to [fly.io](https://fly.io/).

</div>


This guide will work upon the foundation
of the work done in 
[`flutter-phoenix-channels-demo`](https://github.com/dwyl/flutter-phoenix-channels-demo).
We will be using the finished `Flutter` app
from this repository 
and *deploy it* to [fly.io](https://fly.io/).

- [Deploying your Flutter app as a `PWA` 👩‍💻](#deploying-your-flutter-app-as-a-pwa-)
- [Pre-requisites 📝](#pre-requisites-)
- [Creating the release bundle 🧱](#creating-the-release-bundle-)
- [Deploying to `fly.io` 🎈](#deploying-to-flyio-)
- [Re-deploying after making changes ✍️](#re-deploying-after-making-changes-️)
- [And you're done! 🎉](#and-youre-done-)

# Pre-requisites 📝

This demo assumes you have the following 
requirements sorted:
- a [fly.io](https://fly.io/) account.
- the [`flyctl`](https://fly.io/docs/hands-on/install-flyctl/) 
command installed in your computer.
- cloned the [`flutter-phoenix-channels-demo`](https://github.com/dwyl/flutter-phoenix-channels-demo)
project.

If you haven't, 
create an account in [fly.io](https://fly.io/).
and click on the 
`Try It For Free`.

<p align="center">
    <img width="600" alt="fly.io" src="https://user-images.githubusercontent.com/17494745/219681227-66caad8b-b48c-4218-a1a8-797f8a032a16.png">
</p>

You will be redirected to the 
sign-up page.
Fill in your details 
(or alternatively, login with `Github` -
which is *much easier*)
and follow the steps!


<p align="center">
<img width="600" alt="image" src="https://user-images.githubusercontent.com/17494745/219681563-4a69b37b-33df-40cf-b6eb-2b61457ba484.png">
</p>

After following the steps, 
you should have yourself a neat 
`fly.io` account!
You will be redirected to the dashboard,
where you'll be able to manage your own applications.


<p align="center">
<img width="1485" alt="image" src="https://user-images.githubusercontent.com/17494745/219681966-24c9f0fb-b8a3-40a3-95f1-121b63e98171.png">
</p>

In addition to having your own
`fly.io` account,
you also need to install the the command-line interface
[`flyctl`](https://fly.io/docs/hands-on/install-flyctl/) 
to make use of `fly.toml` files 
and easily deploy both apps.
These files are **deployment configuration files**
that this command will use to deploy
the release bundle to your `fly.io` account.

To install `flyctl`, check the following link:
https://fly.io/docs/hands-on/install-flyctl/.

Lastly, *clone* the 
[`flutter-phoenix-channels-demo`](https://github.com/dwyl/flutter-phoenix-channels-demo)
repo to any desired destination in your computer,
and *navigate into the `app` folder*.

```sh
git clone https://github.com/dwyl/flutter-phoenix-channels-demo
cd app
```

If you want to run the app to check if it works,
you can follow its guide in https://github.com/dwyl/flutter-phoenix-channels-demo/tree/main/app.
This app connects to a `Phoenix` server
running on `localhost`, 
so you'll have to follow the instructions 
that were just linked.

**However**,
you don't *need* to do this.
We are going to *focus on deploying this application to the web*,
so you'll get to see it working after it's deployed!

Now that we have all we need,
it's time to create our bundle and deploy it. 

Let's go! 🏃‍♂️


# Creating the release bundle 🧱

After you've cloned the repo,
navigated to the `app` folder,
where the `Flutter` app is located
and installed the dependencies,
let's create the release bundle. 

The app uses
[**environment variables**](https://github.com/dwyl/learn-environment-variables)
to know which URL it should connect to.

The app uses the 
[`String.fromEnvironment()`](https://api.flutter.dev/flutter/dart-core/String/String.fromEnvironment.html)
to fetch these variables.
Therefore,
we need to
**specify the values of these environment variables when creating the release bundle**.
We can do this when running the 
`flutter build` command
to create our release bundle.


Run the following command.

```sh
flutter build web --dart-define=SERVER_URL=wss://flutter-phoenix-channels-backend.fly.dev/socket/websocket --dart-define=CHANNEL_NAME=room:lobby  
```

This will create the release bundle
with the `SERVER_URL` and `CHANNEL_NAME`
environment variables set to
`"wss://flutter-phoenix-channels-backend.fly.dev/socket/websocket"`
and `"room:lobby"` respectively. 
We set these variables by defining them
in the `--dart-define` argument.

> **Note**
> 
> These values are not arbitrary.
> We already have the `Phoenix` server deployed
> in the aforementioned URL.

Your terminal will give you feedback
on the status of the process.

```sh
Running "flutter pub get" in app...                         2,615ms

💪 Building with sound null safety 💪

Compiling lib/main.dart for the Web..
```

This should take a few minutes.
After it's done,
the created bundle will be located
in `build/web/`.

# Deploying to `fly.io` 🎈

We are now *ready* 
to deploy our release bundle to `fly.io`! 

We can easily deploy our Web Flutter application
to [`Fly.io`](https://fly.io/)
by following their guide.

https://fly.io/docs/languages-and-frameworks/static/

Assuming you have `flyctl` CLI installed,
inside this folder,
you can now run the following command.

```sh
flyctl launch
```

The terminal should yield the following output.

```sh
An existing fly.toml file was found for app flutter-phoenix-channels-frontend
? Would you like to copy its configuration to the new app? (y/N) 
```

> **Note**
>
> The repo we downloaded already has the configuration.
> But if you are implementing your own `Flutter` app from scratch,
> you won't have one.
> So this step will be skipped, 
> as no configuration file will be found in your case.
>
> Just proceed as normal. 🚶

Type `Y` and press `Enter`.
This will install all the dependencies
and prepare the application for deployment.

After a few moments, 
`flyctl` will detect the application is a `Dockerfile` app
and will ask you to choose an app name.

```sh
Scanning source code
Detected a Dockerfile app
? Choose an app name (leave blank to generate one): 
```

This will be the name of the deployed application
on `fly.io` and will affect the URL in which it will be deployed.

For now, we are going to be 
using `flutter-phoenix-channels-frontend` as the app name.
Type it into the terminal.

After this, 
it will ask you to select the organization 
the application will be deployed into.

```sh
? Select Organization: <select your org>
```

After this, 
the terminal will ask you to choose a region for deployment.
Choose the one closest to you for better latency results.

```sh
? Choose a region for deployment: <region to select>
```

After selecting the region,
you will be prompted the following question.

```sh
? Would you like to set up a Postgresql database now? (y/N) 
```

Type `N`, as we don't need a Postgresql database.

After this, the terminal will ask you
if you want to setup a Redis database.

```sh
? Would you like to set up an Upstash Redis database now? (y/N) 
```

Similarly, type `N`, since we don't need it.
The terminal should yield the following output now.


```sh
Wrote config file fly.toml
? Would you like to deploy now? (y/N) 
```

If you wish to deploy the application now,
type `y` and press `Enter`.

This will build the image
and deploy the application to `fly.io`.
This might take some minutes, so hang on tight! 👍

After the process is complete,
the terminal should state:

```sh

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v0 deployed successfully
```

That means we've correctly deployed it! 🎉

If you want to check the deployed app,
visit `fly.io`,
log into your account 
and search for it - 
its name is `flutter-phoenix-channels-frontend` 
we defined earlier.

Or alternatively, type `fly open`
and a browser window should open with the deployed app!


# Re-deploying after making changes ✍️

Everytime you make a change 
and want to redeploy the application,
just run `fly deploy`.
Since we've already done the initial configuration needed,
`fly deploy` will just re-build the app
and deploy it to the app that's already deployed.


# And you're done! 🎉

Congratulations!
You now know how to deploy your `Flutter` 
application to the web!

Give yourself a pat on the back! 👏