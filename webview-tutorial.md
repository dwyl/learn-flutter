# Does Flutter use WebView ?

Flutter is different than most other options for building mobile apps because Flutter uses neither WebView nor the OEM widgets that shipped with the device.<br />
 Instead, Flutter uses its own high-performance rendering engine to draw widgets. 
 
 ![Flutter](https://i.imgur.com/cQEIkxV.png)
 
 ## Using WebViews In Flutter 
 
 First of all you need to add the webView package to your pubspec.
 
 ```ruby
flutter_webview_plugin: ^0.3.10+1
```

Now in your 'main.dart' add a 'WebviewScaffold' widget.<br />
Inside the Scaffold add a 'appBar' which supports a title with the text 'Browser'.


 ```ruby
 return WebviewScaffold(
      appBar: AppBar(
        title: Text("Browser"),
      ),
```

Then use the 'url' to specify which site will appear.

 ```ruby
url: "https://github.com/dwyl",
```
