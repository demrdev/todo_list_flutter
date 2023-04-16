import 'package:flutter/foundation.dart';

import 'models/todo.dart';

class TodoList extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void toggleDone(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }
}

