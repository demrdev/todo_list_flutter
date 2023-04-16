import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/todo_list.dart';
import 'screens/todo_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final _title = "Yapılacaklar Listesi";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoList(),
      child: MaterialApp(
        title: _title,
        home: TodoListScreen(),
      ),
    );
  }
}
