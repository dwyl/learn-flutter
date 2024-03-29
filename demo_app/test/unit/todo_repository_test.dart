import 'package:demo_app/repository/todo_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'todo_repository_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  test('Checks if a Todo array is yielded and has the expected length',
      () async {
    final client = MockClient();
    final repo = HTTPTodoRepository();

    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos')))
        .thenAnswer((_) async => http.Response(
            '[{"userId": 1, "id": 2, "title": "mock", "completed": true}]',
            200));

    repo.client = client;

    expect(await repo.getTodos().then((value) => value.length), equals(1));
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();
    final repo = HTTPTodoRepository();

    // Use Mockito to return an unsuccessful response when it calls the
    // provided http.Client.
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    repo.client = client;

    expect(repo.getTodos(), throwsException);
  });
}
