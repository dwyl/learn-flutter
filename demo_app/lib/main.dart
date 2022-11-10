import 'package:demo_app/models/todo.dart';
import 'package:flutter/material.dart';

import 'services/todoService.dart';

// coverage:ignore-start
void main() {
  runApp(const MyApp());
}
// coverage:ignore-end

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      )),
      home: TodoList(todoService: TodoService()),
    );
  }
}

class TodoList extends StatefulWidget {
  final TodoService todoService;

  const TodoList({super.key, required this.todoService});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Future<List<Todo>> futureTodosList;
  final Set<Todo> _doneList = <Todo>{};

  void _pushCompleted() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _doneList.map(
            (todo) {
              return ListTile(
                title: Text(
                  todo.title,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('completed todo list'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureTodosList = widget.todoService.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('todo item list'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushCompleted,
              tooltip: 'completed todo list',
            ),
          ],
        ),
        body: FutureBuilder<List<Todo>>(
          future: futureTodosList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final todolist = snapshot.data!;

              return ListView.builder(
                itemCount: todolist.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, i) {
                  final index = i ~/ 2;
                  final todoObj = todolist[index];

                  if (i.isOdd) return const Divider();

                  final completed = _doneList.contains(todoObj);

                  return ListTile(
                    title: Text(
                      todoObj.title,
                      style: TextStyle(
                          fontSize: 18,
                          decoration: completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    onTap: (() {
                      setState(() {
                        if (completed) {
                          _doneList.remove(todoObj);
                        } else {
                          _doneList.add(todoObj);
                        }
                      });
                    }),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));
  }
}
