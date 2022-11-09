import 'dart:convert';

import 'package:demo_app/models/todo.dart';
import 'package:http/http.dart' as http;

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
}

class HTTPTodoRepository implements TodoRepository {
  @override
  Future<List<Todo>> getTodos() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

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
