import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';
import '../models/todo.dart';
import 'package:auto_size_text/auto_size_text.dart';
class TodoContainer extends StatefulWidget {
  final Todo todo;
  TodoContainer({@required this.todo});

  @override
  _TodoContainerState createState() => new _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  
  bool _value = false;
  _valueChanged(bool _value) => setState(() => _value = _value);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          widget.todo.description != null ?  ListTile(
            leading: new Checkbox(value: _value ,onChanged: (bool value) {
              setState(() {
                _value = value;
              });
            }),
            title: AutoSizeText(
              widget.todo.title,
              maxLines: 3,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
            subtitle: AutoSizeText(
              widget.todo.description,
              maxLines: 10,
              style: TextStyle(
                fontSize: 8.0
              ),
            ),
          ): ListTile(
            leading: new Checkbox(value: _value ,onChanged: (bool value) {
              setState(() {
                _value = value;
              });
            }),
            title: AutoSizeText(
              widget.todo.title,
              maxLines: 3,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          ),
        ],
      ),
    );  
  }
}