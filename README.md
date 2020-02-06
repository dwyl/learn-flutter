# learn-flutter
https://flutter.dev/
## What is Flutter?

Flutter in an open Source SDK for creating high-performance mobile apps for IOS and Android.
The Flutter makes it easier for you to build user interfaces, while reducing the amount of code required to create and update your app.

## Why use Flutter?

- Develop for IOS and Android from a single codebase
- Do more with less code, with a modern, expressive language and a declarative approach
- Experiment by changing code and reloading as your app runs (with hot reload)
- Fix crashes and continue debugging from where the app left off
- Benefit from a rich set of Material Design and Cupertino (iOS-flavor) widgets built using Flutter’s own framework

## Core Principles

Flutter includes a 2D rendering engine, ready-made widgets, and development tools.</br>
These components work together to help you design, build, test, and debug apps.</br>

## Widgets

Widgets are the basic building blocks of a Flutter app’s user interface.</br>
Each widget is an unalterable declaration of part of the user interface.</br>
Flutter has a consistent, unified object model: the widget.</br>

A widget can define:
- a structural element (like a button or menu)
- a stylistic element (like a font or color scheme)
- an aspect of layout (like padding)

Widgets form a hierarchy based on composition. Each widget nests inside, and inherits properties from, its parent. There is no separate “application” object. Instead, the root widget serves this role.

![Screen Shot 2020-02-06 at 19 01 17](https://user-images.githubusercontent.com/27420533/73969408-4475d280-4913-11ea-8384-99c863321155.png)


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
     
     
   ## FloatingActionButton
   
   Is a button displayed floating in the bottom right corner.
   We use this button to promote a primary action in the application.
      
   ## Drawer
   
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


## How can you improve your learning in Flutter?

- Get to know the Flutter platform vividly
- Thoroughly acquaint with all the features of Flutter
- Read through Flutter’s official documentation as it include easy examples that beginners would find helpful. The documents are seasoned with iOS and Android devices. The developers can easily interact with the present device
- Including Google codelabs in the learning process
- Adding the Flutter GitHub repository in the learning process
- Opting for Google’s free beginner Flutter learning course. Google provides a free course for learners. 

