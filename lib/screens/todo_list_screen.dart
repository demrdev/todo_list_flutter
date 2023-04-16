import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models/todo.dart';
import '../models/todo_list.dart';

class TodoListScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String _yapilacaklar = "Yapılacaklar Listesi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_yapilacaklar),
      ),
      body: Column(
        children: [
          _buildTodoInput(context),
          Expanded(
            child: _buildTodoList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoInput(BuildContext context) {
    final TextEditingController _textEditingController = TextEditingController();
    final String _hintText = "Yapılacaklara ekle";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: _hintText,
        ),
        onSubmitted: (text) {
          if (text.isNotEmpty) {
            final todo = Todo(
              text: text,
            );
            Provider.of<TodoList>(context, listen: false).add(todo);
            _textEditingController.clear();
          }
        },
      ),
    );
  }

  Widget _buildTodoList(BuildContext context) {
    return Consumer<TodoList>(
      builder: (context, todoList, child) {
        return ListView.builder(
          itemCount: todoList.todos.length,
          itemBuilder: (context, index) {
            final todo = todoList.todos[index];
            return ListTile(
              title: Text(todo.text),
              trailing: Checkbox(
                value: todo.done,
                onChanged: (bool? value) {
                  Provider.of<TodoList>(context, listen: false).toggleDone(todo);
                },
              ),
              onLongPress: () {
                Provider.of<TodoList>(context, listen: false).remove(todo);
              },
            );
          },
        );
      },
    );
  }
}
