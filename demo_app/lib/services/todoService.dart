import 'package:demo_app/models/todo.dart';
import 'package:demo_app/repository/todoRepository.dart';

class TodoService {
  TodoRepository todoRepository = HTTPTodoRepository();

  Future<List<Todo>> getTodos() => todoRepository.getTodos();
}
