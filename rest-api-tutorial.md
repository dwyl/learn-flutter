# REST API

Is An Application program Interface (API) that uses HTTP requests to GET, PUT, POST and DELETE data.<br />
is based on representational state transfer (REST) technology, an architectural style and approach to communications often used in web services development.<br />
An API for a website is code that allows two software programs to communicate with each another . The API spells out the proper way for a developer to write a program requesting services from an operating system or other application.<br /><br />

> ***A REST API defines a set of functions which developers can perform requests and receive responses via HTTP protocol.***.

![Rest-Api](https://i.imgur.com/ZwQ2L6k.png)


## Why?

All the processing is done on the server side. So the server has to do more work.<br />
The data is not separated from the page.<br />
In REST API, you ask the API server what you need and it sends you just the information you ask for, no additional formatting is done in the server. <br />
There is no need for unnecessary processing in the server. So, the performance of your website and apps are naturally improved. Also, you can use the same data in your website, desktop app, Android and iOS apps.


## How?
### Create a New Project

Create a new flutter project in Android Studio and name it as you like.

![Rest-Api](https://i.imgur.com/tRsrVWO.png)

### Making an API Request In Flutter

First include the http package in 'pubspec.yaml' file.<br />
Add this line under dependencies.<br />

```ruby
dependencies:
  flutter:
    sdk: flutter
  http: ^0.12.0
```
Import the http package in your 'main.dart' file:

```ruby
import 'package:http/http.dart' as http;
```

Create a function getData() which will fetch the data from the API.

```ruby
Future<String> getData(){
   
  }
```
We’ll be making an API call which can take some time to return a response. This situation calls for async.<br />
Basically, we’ll need to wait till the api call completes and returns a result. As soon as it does, we’ll display the list.<br />
We’ll make the api call using http object and wait for it to complete.<br />

```ruby
Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users/1/albums"),
        headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body);
    });
    return "Success";
  }
```

To decode the data you need to use:

```ruby
import 'dart:convert';
```
Now we’ll need to add a listview to our flutter app.


### Adding a ListView
Next, we’ll be adding a listview in our flutter app.If you don’t know how to create a listview in flutter,here you have the link to learn more about ListViews.
https://pusher.com/tutorials/flutter-listviews


Let's create the getList function that will show us the date or show us a message saying "Please Wait".


```ruby
Widget getList() {
  if (data == null || data.length < 1) {
    return Container(
      child: Center(
        child: Text("Please wait..."),
      ),
    );
  }
  return ListView.separated(
    itemCount: data?.length,
    itemBuilder: (BuildContext context, int index) {
      return getListItem(index);
    },
```

Just create a Text widget and add some styling as you like.

## Conclusion

This is a quick example of how to make an API call in Flutter.
