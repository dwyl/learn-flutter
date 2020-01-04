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

Use 'textInputAction' and 'onSubmitted' to go to any site the user wants.

 ```ruby
 textInputAction: TextInputAction.go,
          onSubmitted: (url)=> launchUrl(),
```

Create the 'launchUrl' method.

 ```ruby
 launchUrl(){
setState(() {
  urlString= controller.text;
  flutterWebviewPlugin.reloadUrl(urlString);
});
  }
```

And the variable urlString.

 ```ruby
  var urlString="https://google.com";
```
Create a button so that when the user enters a site they can go directly there.

 ```ruby
    IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () => launchUrl(),
```

This will be the end result.

 ![Flutter](https://i.imgur.com/nk3YDuh.png)
 
 ## Webview Inside Listview
 
 It works the same way as using full screen Webview.<br />
First we create the Scaffold method and an appBar then inside the body you create the Container and then pass the child with the ListView.



```ruby
    return Scaffold(
      appBar: AppBar(title: Text("WebView"),
      ),
      body: Container(
        child: ListView(
       scrollDirection: Axis.vertical,
          children: <Widget>[
            Text("Flutter"),
            Padding(padding: EdgeInsets.all(4.0)),
            Text("Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts to provide full native performance on both iOS and Android."),
            Padding(padding: EdgeInsets.all(4.0)),
            Container(
              height: MediaQuery.of(context).size.height,
             child: WebView(
               initialUrl:"https://flutter.dev/",
               javascriptMode: JavascriptMode.unrestricted.
                 gestureRecognizers: Set() ..add(Factory)<VerticalDragGestureRecognizer>(()=>VerticalDragGestureRecognizer())),
```


 
