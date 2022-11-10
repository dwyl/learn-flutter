import 'dart:convert';

import 'package:demo_app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
}

class HTTPTodoRepository implements TodoRepository {
  Client client = Client();

  @override
  Future<List<Todo>> getTodos() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Todo> todos =
          List<Todo>.from(l.map((model) => Todo.fromJson(model)));

      return todos;
    } else {
      throw Exception('Failed to load Todo\'s.');
    }
  }
}
