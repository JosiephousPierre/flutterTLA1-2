import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';

/// A ChangeNotifier to manage the state of Todos
class TodoNotifier extends ChangeNotifier {
  final List<Todo> _todos = [];

  /// Provides a read-only view of the todos list
  List<Todo> get todos => List.unmodifiable(_todos);

  /// Adds a new Todo item
  void addTodo(String title) {
    _todos.add(Todo(id: DateTime.now().toString(), title: title));
    notifyListeners();
  }

  /// Toggles the completion status of a Todo
  void toggleTodoStatus(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      notifyListeners();
    }
  }

  /// Removes a Todo item by its ID
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

/// A Riverpod provider for the TodoNotifier
final todoProvider = ChangeNotifierProvider<TodoNotifier>((ref) {
  return TodoNotifier();
});
