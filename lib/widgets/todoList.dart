import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';
import '../models/todo.dart';
import './todoContainer.dart';
class TodoList extends StatefulWidget {
  final List<Todo> todos;
  TodoList({@required this.todos});

  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> todos = List.generate(widget.todos.length, (i) => new TodoContainer(todo: widget.todos[i]));
    return new ListView(
      children: todos,
    ); 
  }
}