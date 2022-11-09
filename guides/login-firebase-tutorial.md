
# Signing in with Google using Flutter

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







