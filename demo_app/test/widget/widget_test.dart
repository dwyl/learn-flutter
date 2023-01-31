import 'package:demo_app/models/todo.dart';
import 'package:demo_app/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:demo_app/main.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([TodoService])
void main() {
  testWidgets('Check if appbar renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the appbar renders
    expect(find.text('todo item list'), findsOneWidget);
  });

  testWidgets('Check if item list is rendered', (WidgetTester tester) async {
    final TodoService mockService = MockTodoService();

    when(mockService.getTodos()).thenAnswer((_) async =>
        [const Todo(userId: 1, id: 1, title: 'mocktitle', completed: true)]);

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: TodoList(todoService: mockService)));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(milliseconds: 100));

    // Expect the mocked todo item to be displayed
    expect(find.text('mocktitle'), findsOneWidget);
  });

  testWidgets('Error should be displayed if the server returns error',
      (WidgetTester tester) async {
    final TodoService mockService = MockTodoService();

    when(mockService.getTodos())
        .thenAnswer((_) async => throw Exception('Error getting todos.'));

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: TodoList(todoService: mockService)));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(milliseconds: 100));

    // Expect the mocked todo item to be displayed
    expect(find.text('Exception: Error getting todos.'), findsOneWidget);
  });

  testWidgets('Tapping on a todo item and navigating to the done list page.',
      (WidgetTester tester) async {
    final TodoService mockService = MockTodoService();

    when(mockService.getTodos()).thenAnswer((_) async => [
          const Todo(userId: 1, id: 1, title: 'mocktitle', completed: true),
          const Todo(userId: 1, id: 2, title: 'mocktitle2', completed: true),
        ]);

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: TodoList(todoService: mockService)));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(milliseconds: 100));

    // Tapping on a todo
    await tester.tap(find.text('mocktitle'));
    await tester.pumpAndSettle();

    // Navigating away
    await tester.tap(find.byIcon((Icons.list)));
    await tester.pumpAndSettle();

    // Expect the todo list page to be shown
    expect(find.text('completed todo list'), findsOneWidget);
    expect(find.text('todo item list'), findsNothing);
  });

  testWidgets(
      'Navigating to the todo list directly and find empty widget array',
      (WidgetTester tester) async {
    final TodoService mockService = MockTodoService();

    when(mockService.getTodos()).thenAnswer((_) async => [
          const Todo(userId: 1, id: 1, title: 'mocktitle', completed: true),
          const Todo(userId: 1, id: 2, title: 'mocktitle2', completed: true),
        ]);

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: TodoList(todoService: mockService)));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(milliseconds: 100));

    // Navigating away
    await tester.tap(find.byIcon((Icons.list)));
    await tester.pumpAndSettle();

    // Expect the todo list page to be shown
    expect(find.text('completed todo list'), findsOneWidget);
  });

  testWidgets('Marking todo as done and then as undone',
      (WidgetTester tester) async {
    final TodoService mockService = MockTodoService();

    when(mockService.getTodos()).thenAnswer((_) async => [
          const Todo(userId: 1, id: 1, title: 'mocktitle', completed: true),
          const Todo(userId: 1, id: 2, title: 'mocktitle2', completed: true),
        ]);

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: TodoList(todoService: mockService)));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(milliseconds: 100));

    // Tap and untap
    await tester.tap(find.text('mocktitle'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('mocktitle'));
    await tester.pumpAndSettle();

    // Expect the todo list page to be shown
    expect(find.text('mocktitle'), findsOneWidget);
  });

  testWidgets('Testing main mount', (WidgetTester tester) async {
    final TodoService mockService = MockTodoService();

    when(mockService.getTodos()).thenAnswer((_) async => [
          const Todo(userId: 1, id: 1, title: 'mocktitle', completed: true),
          const Todo(userId: 1, id: 2, title: 'mocktitle2', completed: true),
        ]);

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: TodoList(todoService: mockService)));

    await tester.pumpWidget(testWidget);
    await tester.pump(const Duration(milliseconds: 100));

    // Tap and untap
    await tester.tap(find.text('mocktitle'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('mocktitle'));
    await tester.pumpAndSettle();

    // Expect the todo list page to be shown
    expect(find.text('mocktitle'), findsOneWidget);
  });
}
