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




## Testing

As in all programming languages, frameworks or platforms the secret to a successful Flutter application is to test it _extensively_.
Several tests should created included functional tests and UX tests 
which can help us discover and fix any bugs before users see them!</br>

An application must have tested all functions, classes or tasks needed to run correctly without errors.</br>

Widget tests are necessary to confirm that they are performing their intended function 
and correctly positioned in the layout.</br>
Integration tests serve to test the application as a whole so that we can test the app in a real-world scenario. 

> To learn more about an example of using TDD: https://github.com/dwyl/flutter-counter-example

## Dart Before Flutter?
Before you dive into Flutter you have to learn the programming language that is used to build Flutter apps, and that is Dart.


Flutter for Windows installation
==========
Access the link and click Get Started

![Flutter](https://i.imgur.com/35POvJA.png)      

Select the windows button and then click the "flutter_windows.zip" button.


![Flutter](https://i.imgur.com/ZNPFKsl.png)   

Extract the file and place the folder in directory "C:"<br />
It's probably best to create a folder in the directory like this.

![Flutter](https://i.imgur.com/76IAhtp.png)

This is the console that comes inside the folder in this case the Flutter console, can use to see which devices connected, create a project in Flutter.

![Flutter](https://i.imgur.com/rJe2Uao.png)

In order to access Flutter commands without having to open this console, we can use the Windows prompt itself we need to add Flutter to the environment variables.<br />

You need to go to the bin folder and copy the path then go to the computer properties, then go to advanced system settings.

![Flutter](https://i.imgur.com/tKZP0ZG.png)

Click on environment variables, then go to edit path and paste the path to Flutter.

![Flutter](https://i.imgur.com/OoUtlWO.png)   ![Flutter](https://i.imgur.com/1IvNuGT.png)


As you can see if you go to the windows prompt and run the command "flutter" it already appears.

 ![Flutter](https://i.imgur.com/oSCrjRM.png)
 
 
 Now at the windows prompt if you run the command "flutter doctor" will check if there is anything left to install so that we can develop the applications with Flutter.
 
  ![Flutter](https://i.imgur.com/6SMzguK.png)
  
  If you need to install android studio here is the link:https://developer.android.com/studio <br />
  To install dart and flutter just go to the Android studio and press plugins and search for both. <br />
  After having everything installed just open the Android Studio that will appear "Start a new Flutter Project".
  
  ![Flutter](https://i.imgur.com/1zxPJSP.png)
  
  
  
## Scaffold class?
  
  Provides a framework which implements the basic material design visual layout structure of the Flutter app.
  Contais various functionality from giving an appbar, a floating button, a drawer, background color, bottom navigation bar and body.
  
  
  ### AppBar
  It defines what has to be displayed at the top of the screen.
  Has various properties like title,padding,brightness.
   
   ### Body
   It's the area below the Appbar and behind the buttons.
   Any widget in the body is positioned at the top left corner by default.
     
     
   #### FloatingActionButton
   
   Is a button displayed floating in the bottom right corner.
   We use this button to promote a primary action in the application.
      
   #### Drawer
   
   Is a panel displayed to the side of the body.
   One usually has to swipe left to right of right to left to access the drawer.
   It uses the Drawer properties which is a material design panel that slides from the edge of a Scaffold to show links in an application.
    

Signing in with Google using Flutter
==========   

After a lot of research I realized that the only way to log in to Google without using Firebase is through the packages provided by Google. <br />
  Using these packages we can make the user log in without saving their personal data, except the data we want to show , like email and username.
  
   ![Flutter](https://i.imgur.com/A4kNbpQ.png)
  
Let's get started. First of all we have to create a new Flutter Project.<br />
Choose the Flutter Application option.<br />

   ![Flutter](https://i.imgur.com/b6fVARr.png)
   
Insert the Name of the Project and the company name.<br />
After that in the 'main.dart' remove all the code except the main and switch the (MyApp) to (MaterialApp).<br />
Insert 'Title'.<br />

   ![Flutter](https://i.imgur.com/dLfAgUO.png)
   
 Create a new class to extend a 'StatefulWidget'.<br />
 Change return 'Container' to 'Scaffold' so we can use the features provided by the Scaffold Class.<br />
 
 ![Flutter](https://i.imgur.com/Dfe11We.png)
 
 Enter in 'pubspec.yaml' , then go to google and search for google sign in package flutter or click this link:
 https://pub.dev/packages/google_sign_in, go to installing and add that command to 'pubspec dependecies'.
 
 
 ![Flutter](https://i.imgur.com/TQ18gDR.png)
 
 ![Flutter](https://i.imgur.com/iUtoy36.png)
 
 Click on "Packages get" as we made a change to the packages to update.
 
 
 ![Flutter](https://i.imgur.com/81h384m.png)
 
 Import the Google package to 'main.dart'.
 
  ![Flutter](https://i.imgur.com/AKibdLx.png)
  
  Create the 'GoogleSignIn' object, provide the scope profile and email to that object.
  
   ![Flutter](https://i.imgur.com/9E5uVXH.png)
   
   You need to create a SignInAccount object.<br />
   Name that object 'user' to be used to see if he is signed in or signed out.<br />
   
   Inside the 'Scaffold' use the 'AppBar' to add a Title.<br />
   
  ![Flutter](https://i.imgur.com/mbgBIlY.png)
 
   In the 'body' create a method '_buildbody'.<br />
   Inside that method you need to add a 'ListTile' to display the information,then use a GoogleUserCircleAvatar to display the profile image.<br />
   
   ![Flutter](https://i.imgur.com/4HObCG5.png)
   
   Make the title and subtitle show the 'Name' and 'Email' on the screen.
   Create a button to be pressed with the text 'Sign out'.
   
![Flutter](https://i.imgur.com/yUXiw3F.png)

![Flutter](https://i.imgur.com/bLaPMsK.png)
   
   
 
 In short, if the user is not connected, a message appears saying "Not Signed in". If this user is already connected, his data is displayed and a button appears saying "Sign Out".
 
 
Now, create both _GetSignIn and _GetSignOut methods.<br />
Use the method silently/ SignInSilently(); -> Used to Sign In the user without interaction.

![Flutter](https://i.imgur.com/LK7YprE.png)

After the UI is completed we need to register the App in the Firebase.<br />
Even if we don't need to use Firebase the App has to be registered there.<br />

So go to: https://console.firebase.google.com/u/0/
In the Firebase console, add a new project and get the same package name from your app.


![Flutter](https://i.imgur.com/AGFilMM.png)

You will need to get the SHA-1 so go to 'gradlew' and to the terminal and run the command- 'gradlew signinReport'.

![Flutter](https://i.imgur.com/9JD4DGP.png)

![Flutter](https://i.imgur.com/YnweBh6.png)

Insert the SHA-1 in the Firebase space then, download the file and paste it inside the Android > app.<br />

Follow the steps to add the Firebase SDK / Go to people API:<br />

https://developers.google.com/people/v1/getting-started

Follow those 3 steps.

![Flutter](https://i.imgur.com/ro6RiCJ.png)

After that go to credentials and click the user data option.<br />
Click on the API and go for Android or IOS.<br />
Name your app again, put the SHA-1 you got from 'gradlew' and the package name you can find in your 'AndroidManifest.xml'.<br />


![Flutter](https://i.imgur.com/wkLI4L0.png)


Set up the consent screen, go to support email and select your email then click save.<br />
Go to OAuth 2.0 Cliente IDs, select the Android option.<br />

On your Manifest.xml add below the package name this line:


```ruby
   <uses-permission android:name="android.permission.INTERNET"/>
```

Then just edit the button as you like and the Google login is fully functional.

How to use SQLite in Flutter
==========   


![Flutter](https://i.imgur.com/27rAotE.png)

Persisted data ( persitent Date ) are very important for users, since they would be inconvenient to always be writing your information or wait for the network carry the same data again. In these situations, it would be best to store your data locally.

# Why SQLite?

SQLite is one of the most popular methods for storing data locally. For this article, we will use the package ( package ) sqflite acceded to SQLite. Sqflite is one of the most used and updated packages to connect to SQLite databases in Flutter.


# How to use Sqflite on Flutter?


## 1. Add the dependency to the project <br />
In our project, we will open the file pubspec.yaml and search for dependencies. Under dependencies we add the latest version of sqflite and path_provider(which can be removed from pub.dev).


```ruby
 dependencies:
  flutter:
    sdk: flutter
  sqflite: any
  path_provider: any
```


## 2. Creating a DB Client<br />
Now, in our project, we will create a new Database.dart file.<br />

1- Creation of a private builder that can be used only within the class:


```ruby
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}
```

2- Preparation of the database
Next we will create the database object and provide you with a getter, which will create an instance of the database, if it has not already been created.


```ruby
static Database _database;

  Future<Database> get database async {
    if (_database != null)
    return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }
```

If no objects are assigned to the database, we use the initDB function to create the database. In this function, we get the directory where we will store the database and create the tables we want:


```ruby
initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT,"
          "blocked BIT"
          ")");
    });
  }
```
## 3. Creation of Model Class<br />

The data inside our database will be converted to Dart Maps, so first we need to create the Model Classes with the 'toMap' and 'fromMap' methods.


```ruby

/// ClientModel.dart
import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String firstName;
  String lastName;
  bool blocked;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.blocked,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        blocked: json["blocked"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "blocked": blocked,
      };
}
```



## 4. CRUD Operations<br />

Using 'Insert':


```ruby

newClient(Client newClient) async {
    final db = await database;
    var res = await db.insert("Client", newClient.toMap());
    return res;
  }
```

Get Client via an ID:


```ruby

getClient(int id) async {
    final db = await database;
    var res =await  db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : Null ;
  }
```

Obtain all Clients with one condition:
In this example, we use rawQuery to map the results list to a list of Client objects:

```ruby

getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }
```

Update an existing Client:

```ruby

updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }
```

Delete a Client:

```ruby


deleteClient(int id) async {
    final db = await database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }
```

Delete All Clients:

```ruby


deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }

```


## Trouble-Shooting Section

The *first* time I tried to change the path of the Flutter folder so that it could be accessed by the terminal without having to use several paths, it **did not work**, every time I closed the terminal Flutter was no longer recognized.</br> 

`command not found: flutter`

Whenever I used *this* command:</br>


`export PATH="$PATH:~/development/flutter/bin`

Then I started to notice that this command only worked for the current terminal, so it was not **permanent**.
Even using the command that should change the path permanently Flutter was still **unrecognized**.</br>

This would be the command that would make Flutter access through the terminal permanent:</br>

`export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"`

Changing the path to where we would have cloned Flutter's Git repository [PATH_TO_FLUTTER_GIT_DIRECTORY].
And then using the command: 

`source ~/.bash_profile`


What will help us refresh the terminal.</br>
But even so, every time I closed and opened the terminal again Flutter was no longer recognized.</br>
So I thought that maybe the best option would be to go to the document and edit it with the "export PATH" command but inside the document itself other than in the terminal.</br>

So I went to Finder / Macintosh HD / Users / and to my user.
How is a hidden file or document we must type **`cmd` + `shift` + `.`**

![finder-view-showing-flutter-directory](https://user-images.githubusercontent.com/27420533/74145756-83e43d80-4bf7-11ea-94ca-f6be3cfac21b.png)

Then I opened my **`.zhs_profile`** file and typed the command:

`export PATH=/Users/m/Documents/flutter/bin:$PATH`

This instructs my terminal environment to export an updated version of the `PATH` environment variable with `flutter/bin` path _prepended_ to the current `PATH` variable. (_i.e. add `flutter/bin` to the `PATH` so that my terminal knows where to find the `flutter` CLI_)

Then I saved the file and now going to the terminal Flutter is already recognized and can be accessed without having to run any commands.


![flutter-command-output-truncated](https://user-images.githubusercontent.com/27420533/74146245-9a3ec900-4bf8-11ea-8dca-63b549552ff4.png)




## How can you improve your learning in Flutter?

- Get to know the Flutter platform vividly
- Thoroughly acquaint with all the features of Flutter
- Read through Flutter’s official documentation as it include easy examples that beginners would find helpful. The documents are seasoned with iOS and Android devices. The developers can easily interact with the present device
- Including Google codelabs in the learning process
- Adding the Flutter GitHub repository in the learning process
- Opting for Google’s free beginner Flutter learning course. Google provides a free course for learners. 
