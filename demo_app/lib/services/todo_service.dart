import 'package:demo_app/models/todo.dart';
import 'package:demo_app/repository/todo_repository.dart';

class TodoService {
  TodoRepository todoRepository = HTTPTodoRepository();

  Future<List<Todo>> getTodos() => todoRepository.getTodos();
}
