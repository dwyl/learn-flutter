<div align="center">

![Learn](https://user-images.githubusercontent.com/17494745/200544789-0b024c77-0d49-4702-8866-b69f61521033.png)

Learn the Flutter basics to get up-and-running **fast** and build **awesome cross-platform applications**!

</div>

# What? 💡

Flutter is an open-source framework created by Google
for creating multi-platform, high-performance applications
from a single codebase. It makes it easier for you to build
user interfaces that works both on web and mobile devices.

Flutter uses [Dart](https://github.com/dwyl/learn-dart), a
general-purpose programming language created by Google.
If you come from an object-oriented language like `Java`, `C#`,
`Go` or `Javascript/Typescript`, you will feel right at home. 

# Why? 🤷

- Flutter can be used to build cross platform native applications 
(Android, iOS, Desktop and Web) using the same codebase. 
This significantly simplifies maintenance costs and dev headache 
when deploying for either Android or iOS devices. 

- The Dart programming language used in Flutter
 is object oriented and familiar to most developers.
Flutter benefits immensely by leveraging Dart. 
Being a language optimized for UI and compiling to ARM 
& x64 machine code for mobile, desktop and backend,
it offers amazing performance benchmarks. 

- Development times are significantly faster
 than other cross-platform frameworks 
 thanks to stateful hot-reloading 
 and excellent virtual device support.
If we close the application,
when we open it again 
we can continue from where we stopped.

- Flutter has a _complete_ design system 
with a library of Material UI widgets 
included which speeds up the 
development process.

- It's growing at a fast-pace and being increasingly used
in production worldwide. 

![fast-pace](https://user-images.githubusercontent.com/194400/84572723-e3b04800-ad93-11ea-85e2-19e9693e5a26.png)

- Flutter has overtaken React Native in searchs, 
further showcasing the growing trend of Flutter. 
Also, Flutter is [probably more performant](https://www.orientsoftware.com/blog/flutter-vs-react-native-performance/)
than React Native in mobile devices.

![rn](https://user-images.githubusercontent.com/17494745/198244948-29e5d3a5-1b2b-4d1f-a434-d4eee2a5799c.png)

# Who? 👤
This repo is useful for anyone 
that is interested in mobile and web app development. 
For anyone that hasn't yet touched Flutter, this 
repo is a *great* place to start to get your computer
ready for Flutter/Dart development, understand the
**main concepts** and *guide* you to then create
your very first Flutter app. 

# Installing Flutter ⬇️
Installing Flutter might seem like a daunting task.
But do not worry, we'll help you get your local environment
running in no time! Since we are targetting web and mobile,
there are a few tools and SDKs we ought to install first. 

These steps will be oriented to Mac/Unix devices but you should 
be able to follow if you have a Windows device. If you're ever stuck,
don't be shy! Reach out to us and [open an issue](https://github.com/dwyl/learn-flutter/issues),
we'll get back to you as fast as we can!

## Installing Flutter SDK
Head over to https://docs.flutter.dev/get-started/install,
select your operating system and follow the instructions. 

In our case, we're going to download the SDK for
our Mac. After downloading the SDK, you should extract
the `.zip` contents to a wanted location
(in our case, we extracted the folder to our `Home` - `cd ~`).

Now, we ought to update our `PATH` variable so we can access
the binary we just downloaded to our command line. Open your terminal and:

```sh
cd $HOME
nano .zshrc
```

And add `export PATH="$PATH:`pwd`/flutter/bin"` pointing
to the location where you extracted the folder. 
Now, if you restart the terminal and type `flutter doctor`,
you should be able to run the command with no problems.

`flutter doctor` checks your environment and displays a report to the
terminal window. It checks it all the necessary tools for development
for all devices are correctly installed. Let's do just that.

> If you found this procedure convoluted, you can alternatively
install Flutter through [Homebrew](https://brew.sh/).
After installing Homebrew, you can install Flutter by simply running 
`brew install --cask flutter`.

## Install XCode
To install XCode, simply open your AppStore, search for 'XCode'
and press `Install`. It's that easy.

<img width="1292" alt="image" src="https://user-images.githubusercontent.com/17494745/200554456-ff9dc9cb-7a2a-4eb8-aff4-90dfd00a0427.png">

### Install Android Studio
Now targetting for Android devices, we need to install Android SDK and toolkits.
For this, we are going to install Android Studio and work from there.
Head over to https://developer.android.com/studio and download.

After downloading, run the installer and select `Default settings` and let
the installer do its magic. After this, you should be prompted with the following window.

<img width="798" alt="image" src="https://user-images.githubusercontent.com/17494745/200555036-2f7916aa-7171-409f-8f44-70f13ca3a8ec.png">

Click on the `More actions` dropdown and click on `SDK Manager`. 
You should be prompted with this window.

<img width="1094" alt="Screenshot 2022-11-08 at 11 41 29" src="https://user-images.githubusercontent.com/17494745/200555203-7108472b-62b7-4df7-9709-a6797901094f.png">

After installing with default settings, you probably already have 
an Android SDK installed. If that's the case, follow through
to `SDK Tools` and check on `Android SDK Command-line Tools`.

<img width="1094" alt="image" src="https://user-images.githubusercontent.com/17494745/200555496-34fa04f2-cb95-4066-8c37-a29b6cdab9fb.png">

And then click `Finish`. This will install the command line tools.

After installing, copy the `Android SDK Location` in the window.
Open a terminal window and type the following to add the SDK path
to the `Path` env variable.

```sh
cd $HOME
nano .zshrc
```

and then add the SDK path you just copied, and save the file

`export ANDROID_HOME=PATH_YOU_JUST_COPIED`

Restart your terminal again and type `flutter doctor --android-licenses`.
This will prompt you to accept the Android licenses. Just type `y` as you read
through them to accept.

## Installing Cocoapods
If you run `flutter doctor` again, you should see we are almost done. 
You might see a text saying `CocoaPods not installed`. Let's fix that.

Install [Homebrew](https://brew.sh/) and run `brew install cocoapods`.

And you should be all sorted!

## Adding plugins to Android Studio
If you happen to use Android Studio when developing, 
adding the Flutter plugin will help you tremendously. 
Just open Android Studio, click on `Plugins`, 
search for "Flutter" and click `Install`.

<img width="912" alt="image" src="https://user-images.githubusercontent.com/17494745/200556642-728e0f0a-8af8-43ab-b8e9-1c5a8bcbd6c3.png">

You are asked to "Restart the IDE". Do so and ta-da :tada:, you are done!

## Checking everything
If you run `flutter doctor`, you should have everything in the green.

<img width="697" alt="image" src="https://user-images.githubusercontent.com/17494745/200557242-d192557b-8354-4182-9b57-19764261ca71.png">

Congratulations, give yourself a pat on the back, you are **all ready**!


### Installing for Windows devices

Installing Flutter on Windows should be the same process
as the one on MacOS'. However, setting up the `$PATH` 
variable is different, since some terminal commands
can't be used in Windows since it's not an Unix-based 
operating system. 

With this in mind, here's a quick rundown of how things 
should go if you're installing Flutter on Windows.
Firstly, head over to https://docs.flutter.dev/get-started/install/windows
and download the `.zip` file.

![download](https://i.imgur.com/ZNPFKsl.png)   

Extract the file and place the folder in directory `C:`.
It's probably best to create a folder in the directory like this.


![cdrive](https://i.imgur.com/76IAhtp.png)

This is the console that comes with the Flutter folder
you just downloaded. You can see the devices connected or 
even create a project through here.

![flutterconsole](https://i.imgur.com/rJe2Uao.png)

In order to access Flutter commands through the terminal,
instead of having to open this console, we need to update
our environment variables.

You need to go to the bin folder of the extracted
`.zip` you downloaded and pasted on the `C:` drive
and copy the path.
Then, go to the computer properties, then go to advanced system settings.

![properties](https://i.imgur.com/tKZP0ZG.png)

Click on environment variables,
go to edit path and paste the path to the extracted
Flutter folder.

![properties2](https://i.imgur.com/OoUtlWO.png)
![properties3](https://i.imgur.com/1IvNuGT.png)


As you can see, if you open a new Windows terminal
(also known as `windows prompt`) and 
run the `flutter` command, this should prop up.

 ![run_command](https://i.imgur.com/oSCrjRM.png)
 
The rest of the steps should be straight forward. 
Just follow the ones on the Mac device. 
Installing Android Studio is the exact same procedure
:smile:.  

# Core Principles 🐣

If you have had experience in mobile development prior to Flutter,
either be it React Native or native, you will find the learning curve
quite manageable, as Flutter's foundation is built upon a few principles
that are present in both. Let's take a look at these :smile:.

If you want an in-depth guide and learn every aspect of Flutter,
check the official documentation -> https://flutter.dev/learn

## Widgets

In Flutter _everything_ is a **Widget**.

A Widget is a UI building block you can use to assemble your app. 
If you come from `React`, you may find these akin to `components`.

You will build your UI out of widgets. They essentially describe
what *their view should look like* given their current state. 
If their state changes, the widget rebuilds and checks the diff
to determine the minimal changes to transition from the state `t0` to `t1`.


In the following `.gif` the sample application contains a total of 6 widgets:

![widget-gif](https://user-images.githubusercontent.com/194400/74101695-87fb5700-4b34-11ea-9fbd-09cc6bf3ed41.gif)

Image attribution: https://uxplanet.org/why-you-should-use-google-flutter-42f2c6ba036c

1. The **container** widget `Scaffold` starting on line 38 groups all other widgets in the layout.
2. The ***`appBar`*** widget displays the text "Flutter Demo Home Page"
3. The ***`body`*** contains a **child** widget which in turn has **Text** and a **$_counter** placeholder. 
4. The ***`floatingActionButton`*** is the button that gets clicked, 
it contains a **child** which is the icon.
Examples of Widgets include 
dialog windows, buttons, icons, menus, scroll bars and cards.
You can use one of the many built-in Material UI widgets
or create your own from scratch.

A widget can be defined as:
- Physical elements of an application (buttons, menus or bars)
- Visual elements such as colors  
- Layout and positioning of elements on the screen using a grid system

Widgets are assembled in declarative hierarchy 
which allows us to easily organize 
the layout of our App as a series of nested widgets.</br>

![system](https://user-images.githubusercontent.com/27420533/73969408-4475d280-4913-11ea-8384-99c863321155.png)

Screens are composed of several small widgets that have only one job. 
Groups of widgets are assembled together to build a functional application.

For example, a Container widget contains other widgets
 that have functions like layout, placement and size.

A basic screen layout is controlled by combining
a container and other smaller widgets as their children.
This was seen in the gif above. The `Scaffhold` widget
warps three widgets. 

Remember, Widgets aren't necessarily visual elements within the application.
In the gif above, the second child `body` widget also uses
a widget named `Center` that, as the name implies, centers
its children within the screen. It's *controlling* the 
aspects of their child and displaying them centered.
There are several other widgets that have a similar behaviour,
such as padding, alignment, row, columns, and grids.

### Stateless widgets 
Widgets are not all stateless. Stateless widgets never change. 
They receive arguments from their parent, store them in `final` member variables
(`final` is analogous to a `const`ant variable). When a widget is asked
to `build()`. it uses these stored values and renders. 
Here's what a stateless widget looks like:

```dart
class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
```

We notice straight away the widget is a subclass of 
[`StatelessWidget`](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html).

All widgets have a `Key key` (`super.key`) as optional parameter in their ocnstructor. 
It is by the flutter engine at the step of recognizingg which widget 
in a list as changed. It's more useful when you have a list of widgets 
*of the same type* that can potentially be removed or inserted.

This `MyAppBar` widget takes as argument a `title`.
This effectively becomes the `field` of the widget,
and is used in the `Expanded` children widget. 
Additionally, since this is a widget (more specifically, 
a subclass of `Stateless Widget`), we have to 
implement the `build()` function. This is what is rendered.

This widget could be used in a container and be one of its childrens
like so: 

```dart
  MyAppBar(
    title: Text(
      'Example title',
    ),
  ),
```

Simple enough, right?

### Stateful widgets
While stateless widgets are static (never change),
**stateful widgets** are dynamic. For example,
they change its appearance or behaviour according
to events triggered by user interaction or when 
it receives data.

For example `Checkbox`, `Slider`, `Textfield` are examples 
of stateful widgets - subclass of 
[`StatefulWidget`](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).
A widget's state is stored in a `State` object. 
Therefore, we *separate* the widget's state from its appearance. 
Whenever the state changes, the `State` object calls `setState()`,
thus rerendering the widget.

Let's see some code!

```dart
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  // This is the state object, different from the appearance.
  // It holds the state configuration and
  // the values provided by the parent and used by the build method
  // of the State (no values are provided in this instance)
  // Fields in a Widget subclass are always marked

  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework
      // that something has changed in this State, which
      // causes it to rerun the build method below so that
      // the display can reflect the updated values. If you
      // change _counter without calling setState(), then
      // the build method won't be called again, and so
      // nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance, as done by the _increment method above.
    // The Flutter framework has been optimized to make
    // rerunning build methods fast, so that you can just
    // rebuild anything that needs updating rather than
    // having to individually changes instances of widgets.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}
```

Let's unpack the code above. The `StatefulWidget` and `State` are separate objects.
The former (being the first one) declares its state by using the State object.
The State object is declared right after, initializing a `_counter` at 0.
It declares an `_increment()` function that calls `setState()` 
(indicating the state is going to be changed) and increments the `_counter` variable.

As with any widget, the `build()` method makes use of the `_counter` variable
to display the number of times the button is pressed. Everytime it is pressed,
the `_increment()` function is called, effectively changing the state and incrementing it.

## Layout

As we've already stated, the core of Flutter are widgets. 
In fact, almost everything is a widget - even layout models.
The things you see are widgets.

![image](https://user-images.githubusercontent.com/17494745/200579851-de25d19d-5c80-4033-8491-c2ff452f7137.png)

But things that you *don't see* are also widgets. 
We mentioned this before but we'll understand it better now. 
For any web or mobile app development, 
we need to create layouts to organize our components in and
make it look *shiny* :shiny: and *good-looking* :art:.

This example is taken from the official docs 
-> https://docs.flutter.dev/development/ui/layout#lay-out-a-widget

Layout           |  Layout with padding and delimited borders
:-------------------------:|:-------------------------:
![](https://docs.flutter.dev/assets/images/docs/ui/layout/lakes-icons.png)  |  ![](https://docs.flutter.dev/assets/images/docs/ui/layout/lakes-icons-visual.png)


So, you may ask, **how many widgets are there in this menu**?
Great question! There are visible widgets but also widgets that
*help us* lay out the items correctly, center them and space
them evenly to make it look good. 
Here's how the widget tree looks like for this menu.

![widget_tree](https://docs.flutter.dev/assets/images/docs/ui/layout/sample-flutter-layout.png)

The nodes in *pink* are containters. They are *not visible* 
but help us customize its child widget by adding
`padding`, `margin`, `border`, `background color`, etc...

Let's see a code example of an invisible widget that will
center a text in the middle of the screen.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
```

The `Center` widget centers all its children inside of it.
`Center` is *invisible* but is a widget nonetheless.
This yields the following result.

![invisible_result](https://docs.flutter.dev/assets/images/docs/ui/layout/hello-world.png)


See? Isn't it so simple? :tada:

As you would do in React, you can whatever Layout you wish just
by encapsulating widgets (akin to components) and ordering
them accordingly.

## Assets
For any application, sometimes we need images and assets to display to the user.
Common resources are image files, static data (`JSON` files), 
videos, icons...

In Flutter, we use the `pubspec.yaml` file
(often located at the root of the project) to
require assets in the app.

```yaml
flutter:
  assets:
    - directory/
    - assets/my_icon.png
```

> There's a nuanced behavior when loading assets.
> If you have two files ` .../graphics/background.png` and
> `.../graphics/dark/background.png` and the `pubspec.yaml` file 
> contains the following:

> ```yaml
> flutter:
>   assets:
>     - graphics/background.png
> ```

> Both are imported and included in the asset bundle. 
> One is considered the **main asset** and the other
> a **variant**.
> This behaviour is useful for images on different resolutions.

There are two ways of accessing the loaded access. 
Each Flutter app has a `RootBundle` for easy access
to the main asset bundle. You can import directly
using the `rootBundle` global static. 
However, inside a widget context, it's recommended to obtain the
asset bundle for the widget `BuildContext` using the 
[`DefaultAssetBundle`](https://api.flutter.dev/flutter/widgets/DefaultAssetBundle-class.html).
This approach allows the parent widget to substitute a different 
asset bundle at runtime, which is useful for localization
or testing purposes.

Here's a code example for the `rootBundle` approach.

```dart
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
```

Here's a code example for the recommended approach inside
a widget.

```dart
String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
final jsonResult = jsonDecode(data); //latest Dart
```

## Navigation and routing
Most web and mobile apps aren't just a single page.
The user needs to navigate between screens to do whatever
action needs to be done, be it checking the details of a
product or just wanting to see the shopping cart. 

Flutter provides a `Navigator` widget to display screns as a stack,
using the native transition animations of the target device. 
Navigating between screens necessitates the route's 
`BuildContext` (which can be accessed through the widget) and 
is made by calling methods like `push()` and `pop()`.

Here's a code showcasing navigating between two routes.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
```

This basic code example shocases two routes,
each one containing only a single button.
Tapping the one on the first route
will navigate to the second route. 
Clicking on the button of the second route 
will return the user to the first route.
We are using the `Navigator.push()` and `Navigator.pop()`
functions to achieve this, by passing the context of
the widget. 
Additionally, we are leveraging `MaterialPageRoute` to
transition between routes using a platform-specific animation
according to the [Material Design guidelines](https://m3.material.io/).

Here's how it should look!

![navigating_gif](https://user-images.githubusercontent.com/17494745/200613079-f65baeee-a822-4a58-b075-ce169d751325.gif)


If your application necessitates advanced navigation and routing requirements
(which is often the case with web apps that use direct links to each screen,
or an app with multiple `Navigator` widgets), you should consider using a
routing package like [`go_router`](https://pub.dev/packages/go_router). 
This package allows one to parse the route path and configure the `Navigator`
whenever an app receives, for example, a deep link.


## Networking
For most apps, fetching data from the internet is a must. 
Luckily, fetching data from the internet is a breeze. Let's do it!

Firstly, we need to add the [`http`](https://pub.dev/packages/http)
package to the dependencies section in the `pubspec.yaml` file. 
This file can be found at the route of your project.

Let's add the package to the dependency list and import it.

```yaml
dependencies:
  http: 0.13.5
```

```dart
import 'package:http/http.dart' as http;
```

We also need to change the `AndroidManifest.xml` file to 
add Internet permission on Android devices. This file can be found in the 
`android/app/src/main` on newly created projects. Add the following line.

```xml
<!-- Required to fetch data from the internet. -->
<uses-permission android:name="android.permission.INTERNET" />
```


Now, to make a network request is as easy
as apple pie. Check the following code.

```dart
Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
}
```

By calling `http.get()`, it returns a [`Future`](https://github.com/dwyl/learn-dart#asynchronous-events)
that contains a `Response`. `Future` is a class to work with async operations.
It represents a potential value that will occur in the future.

While `http.Response` has our data, it's much more useful to translate it
to a logical class. We can convert `http.Response` to a `Todo` class, 
representing a "todo item". Let's create that class!

```dart
class Todo {
  final int id;
  final String title;
  final bool completed

  const Todo({
    required this.id,
    required this.title,
    required this.completed
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
```

We can create a function that makes the http request and,
if it is successful, tries to parse the data and create a
`Todo` object or raise an an error if the http request is 
unsuccessful.

```dart
Future<Todo> fetchTodos() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Todo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load todos');
  }
}
```

How would we call this inside a widget? 
We could do this inside `initState()`! 
It is called exactly one time and never again!
Do **not** put an API call in the `build()` method
(unless you know what you are doing). 
This method is called every time a render occurs,
which is quite often!

```dart
class _MyAppState extends State<MyApp> {
  late Future<Todo> futureTodo;

  @override
  void initState() {
    super.initState();
    futureTodo = fetchTodo();
  }
  // ···
}
```

Finally, to display the data, we would want to use the
`FutureBuilder` widget. As the name implies, it's a 
widget made to handle async data operations. 

```dart
FutureBuilder<Todo>(
  future: futureTodo,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data!.title);
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
  },
)
```

The `future` paramter relates to object we want to work with.
In this case, it is a parsed `Todo` object. 

The `builder` function tells Flutter what needs to be rendered, 
depending on the current state of `Future`, which can 
be *loading*, *success* or *error*. 
Depending on the result of the operation, we
either show the error, the data or a loading animation
while we wait for the http request to fulfill.

Isn't it easy? =)

## Local databases
Sometimes, when writing an app, we need to persist
and query large amounts of data on the local device. 
In these cases, it is beneficial considering 
using a database instead of a local file or a key-value store. 

In this walkthrough, we are going to present
two alternatives: SQLite and ObjectBox.

### SQLite 

SQLite is one of the most popular methods for storing data locally.
For this demo, we will use the package 
[`sqflite`](https://pub.dev/packages/sqflite).

Sqflite is one of the most used and updated packages
to connect to SQLite databases in Flutter.

#### 1. Add the dependencies
To work with SQLite databases, we need
to import two dependencies. 
We'll use `sqflite` to interact with the SQLite database,
and `path` to define the location for storing the database
on disk.


```dart
dependencies:
  flutter:
    sdk: flutter
  sqflite:
  path:
```

And import the packages in the file you are working in.

```dart
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
```

#### 2. Define a model
Let's take a look at the data we are going to store.
Let's define a class  for the table we are going to create
in SQLite.

```dart
class Item {
  final int id;
  final String text;
  final bool completed;

  const Item({
    required this.id,
    required this.text,
    required this.completed,
  });

  // Convert an Item into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'completed': completed,
    };
  }

  // Implement toString to make it easier to see information about
  // each item when using the print statement.
  @override
  String toString() {
    return 'Item{id: $id, text: $text, completed: $completed}';
  }
}
```

#### 3. Open connection to the database
To open a connection to the SQLite database,
we are going to define the path to the database file 
using `path`
**and** 
open the database with `sqflite`.

```dart

WidgetsFlutterBinding.ensureInitialized();

// Open the database and store the reference.
final database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  join(await getDatabasesPath(), 'item_database.db'),
);
```

#### 4. Creating table
To create the table to store our items, we must first
verify the number of columns and type refer
exactly to the ones we defined in the class. 
After this, it's just a matter of running the appropriate
`SQL` expression to create the table. 

```dart
final database = openDatabase(
  
  join(await getDatabasesPath(), 'item_database.db'),

  // When the database is first created, create a table to store items.
  onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE items(id INTEGER PRIMARY KEY, text TEXT, completed INTEGER)',
    );
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 1,
);
```

#### 5. CRUD operations

Now that we have a database created, alongside the
table, to create, update, list and insert Items is
quite easy! Check the following piece of code.

```dart
Future<void> crudOperations(Item item) async {
  // Get a reference to the database
  final db = await database;

  // Insert an Item into the table.
  await db.insert('items', item.toMap())

  // Retrieve list of items
  // and convert the List<Map<String, dynamic> into a List<Item>.
  final List<Map<String, dynamic>> maps = await db.query('items');
  Item[] items = List.generate(maps.length, (i) {
    return Item(
      id: maps[i]['id'],
      name: maps[i]['text'],
      age: maps[i]['completed'],
    );
  });

  // Update the given Item.
  await db.update(
    'items',
    item.toMap(),
    // Ensure that the Item has a matching id.
    where: 'id = ?',
    // Pass the Item's id as a whereArg to prevent SQL injection.
    whereArgs: [item.id],
  );

  // Remove the Item from the database.
  await db.delete(
    'items',
    // Use a `where` clause to delete a specific item.
    where: 'id = ?',
    // Pass the Item's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
```

And there you have it! Here is a quick rundown of the 
process of creating a database, a table and 
applying CRUD operations on it. You can leverage
this database to hold large amounts of data locally
(up to a limit, of course) instead of relying 
on common files.


### ObjectBox
There are alternatives to SQLite, such as Hive and `ObjectBox`.
In this section, we are going to just reference 
`ObjectBox` so the user knows there isn't one single
database option.  

`ObjectBox` provides a NoSQL database that uses a
pure Dart API, so there is no need to learn
and write SQL expressions. There are performance
advantages to using this library. Make sure
to read the [package docs](https://github.com/objectbox/objectbox-dart#flutter-database-for-fast-dart-object-persistence-)
to find out if this option is best for you.

Here is how basic setup and CRUD
operations would work using `ObjectBox`.

```dart
// Annotate a Dart class to create a box
@Entity()
class Person {
  @Id() 
  int id;
  String name;

  Person({this.id = 0, required this.name});
}

// Put a new object into the box
var person = Person(name: "Joe Green");
final id = box.put(person);

// Get the object back from the box
person = box.get(id)!;

// Update the object
person.name = "Joe Black";
box.put(person);

// Query for objects
final query = (box.query(Person_.name.equal("Joe Black"))
  ..order(Person_.name)).build();
final people = query.find();
query.close();

// Remove the object from the box
box.remove(person.id);
```

## State management
We have previously mentioned state within a widget.
In stateful widgets, the state and how/when it changes
determines how many times the widget is rendered. 
State that can be neatly contained in a single widget
is referred as "local state" or **ephemeral state**. 
Other parts of the widget tree seldom need to access this kind of state.

However, there is state that is *not ephemeral* 
and usually is needed across many widgets of the app.
This shared state is usually called **application state**.
Examples of these are user preferences or a shopping cart 
in an e-commerce app.

Consider the following gif, taken directly 
from the `Flutter` docs
-> https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro

![cart](https://docs.flutter.dev/assets/images/docs/development/data-and-backend/state-mgmt/state-management-explainer.gif)


Each widget in the widget tree might have its own
local state but there's a piece of *application state* 
(i.e. shared state) in the form of a cart. 
This cart is accessible from any widget of the app -
in this case, the `MyCart` widget uses it to list what
item was added to it.

There are [many approaches to state management](https://docs.flutter.dev/development/data-and-backend/state-mgmt/options), 
so it's up to you to decide which options are best
suited for your use case. Many people recommend 
[`Provider`](https://pub.dev/packages/provider) or 
[`Riverpod`](https://riverpod.dev/). 

[Bloc](https://bloclibrary.dev/#/) is also an increasingly
popular alternative which forces the logic and the UI
to be implemented separately. 

State management and which alternative is best
is a [big point of contention](https://www.reddit.com/r/FlutterDev/comments/w4osgi/for_you_what_is_the_best_state_management_with/)
between developers. There is no bad option, just choose whichever
you think it's best. 

We shall not delve too much into state management as 
shared app state is not a beginner-friendly topic
to learn and is often very opinionated. As long 
as you understood *what it is*, it's awesome! :tada:


# Testing 🧪

As in all programming languages, frameworks or platforms,
the secret to a successful application is to test it _extensively_.
Implementing tests is not only advantageous to catch bugs
but also avoid regression when implementing new features.

> To learn more about an example of using TDD:
> https://github.com/dwyl/flutter-counter-example

> If you are interested in a more thorough introduction
> to testing and debugging in various IDEs with Flutter, please
> take a look at the [official docs](https://docs.flutter.dev/testing/debugging)

## Unit testing
Unit testing are handy to verify the behaviour
of a single function/method/class. 
Let's add some unit tests in Flutter, shall we?

Firstly, we ought to import the [`test`](https://pub.dev/packages/test)
which offers the core functionality for writing tests in Dart.

```dart
dev_dependencies:
  test: 1.22.0
```

And now, let's create a simple class and a referring test
file to test it. Create two files so you have the following
folder structure.

```
counter_app/
  lib/
    counter.dart
  test/
    counter_test.dart
```

In `counter.dart`, add the following piece of code.

```dart
class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
```

In `counter_test.dart`, add the following:

```dart
// Import the test package and Counter class
import 'package:counter_app/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
```

We can group tests using the `group()` function. In each 
`test()` we use the `expect()` function to compare 
expected assertions.

You can type the following command to run the tests
we just created:

```sh
flutter test test/counter_test.dart
```

### Mock testing
Sometimes functions fetch data from web services or databases.
When we are unit testing these, it is inconvenient to do so
because calling external dependencies may slow down 
the execution time. Needless to say, this external dependency
may sometimes be down, amongst other scenarios.

In these situations, it is useful to **mock** 
these dependencies. In Flutter, the *de facto* way of
mocking classes and objects is using the 
[`mockito`](https://pub.dev/packages/mockito)
package. 

In this small section, we are going to add
this dependency, create a function to test 
and mock a test file with a mock `http.Client`.

Firstly, add the `mockito` package to the `pubspec.yaml` 
file, along with the `flutter_test` dependency
(will provide core testing functionalities) and the
`http` package for HTTP requests. 
Do take note that each test dependency will be
added to the `dev_dependencies` section of the file.

```dart
dependencies:
  http: 0.13.5
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: 5.3.2
  build_runner: 2.3.2
```

Now let's create a function to test.
This function will fetch data from the internet.

```dart
Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
```

You might have noticed the `http.Client` is provided 
to the argument. This makes it so that the client
that fetches data changes according to any situation.
In Flutter, we can provide an `http.IOClient`. 
For testing, we can pass a mock `http.Client`.

In a test file, we will add an an annotation to the main function
to generate a `MockClient` class with `mockito`.
According to the argument passed to the annotation,
the generated `MockClient` class will implement it.
When generating, the mocks will be located in a file
named `XX_test.mocks.dart`. We will import this file to use them.
For now, create a test file where we will add tests.

```dart
import 'package:http/http.dart' as http;
import 'package:mocking/main.dart';
import 'package:mockito/annotations.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
}
```

Now run `flutter pub run build_runner build`. 
This command will generate the mocks in `XX_test.mocks.dart`.
Now we can use these mocks in our tests! 
Let's add two: one for a successful request and
another for a failing one, and catch the raised exception.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocking/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
```

In these tests, we are **importing** the generated mocks
(`fetch_album_test.mocks.dart`).
Plus, we create the `MockClient()`, define the behaviour
we expect the mock to do, and then pass it to the function,
effectively asserting its output.

We can run the tests and see if they fail or not
by running 

```sh
flutter test test/fetch_album_test.dart
```

Congratulations! You just mocked a `http.Client` object
and properly tested a function that used an external dependency.
`mockito` has many other features. 
You can read about them
[in their documentation](https://pub.dev/packages/mockito).

## Integration testing
While unit testing is useful for testing individual
classes, functions or widgets, they don't
test how all of these *work together*, as a whole.
These tasks are captured and tested
with **integration tests**. 

We can luckily leverage the SDK's 
[`integration_test`](https://github.com/flutter/flutter/tree/main/packages/integration_test)
package to do this.

Let's start by creating a super simple app. 
This app will just have a button and a counter
displaying the number of time the button was clicked.

But, before that, let's add the needed dependencies.
We'll be adding the `integration_test` and `flutter_test` 
packages to the `dev_dependencies` section of `pubspec.yaml`.

```yaml
dev_dependencies:
  integration_test:
    sdk: flutter
  flutter_test:
    sdk: flutter
```

Now, let's create our app. In `lib/app.dart`, 
let's use the following piece of code.

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Counter App',
      home: MyHomePage(title: 'Counter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // Provide a Key to this specific Text widget. This allows
              // identifying the widget from inside the test suite,
              // and reading the text.
              key: const Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

Now, inside `integration_test/app_test.dart`, we are
going to test the action of clicking and checking
if the counter is incremented. For this, we will
initialize a singleton service `IntegrationTestWidgetsFlutterBinding`, 
which executes the tests on a physical device and
leverage the `WidgetTester` class to interact 
with the widgets. 

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:counter_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });
}
```

Running these on mobile devices is the same
process as before - just run `flutter test integration_test`.
However, if you were to run these on a web browser,
you'd need to download [`ChromeDriver`](https://chromedriver.chromium.org/downloads),
create a file in `test_driver/integration_test.dart` with

```dart
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver();
```

and open two terminal windows.
In the first one, we launch `chromedriver` with 

```sh
chromedriver --port=4444
```

and in the other, from the root of the project, run flutter 
with the drive file path we just created and 
targetting the test file we want to test, like so:

```dart
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d chrome
```

And you're done! Congratulations, you just 
unit *and* integration tested your application.
Awesome work! :tada:


## Fazer sample app simples