import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';
import '../models/toHave.dart';
import './toHaveContainer.dart';
class TodoHaveList extends StatefulWidget {
  final List<ToHave> tohave;
  TodoHaveList({@required this.tohave});

  @override
  _TodoHaveListState createState() => new _TodoHaveListState();
}

class _TodoHaveListState extends State<TodoHaveList> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> toHave = List.generate(widget.tohave.length, (i) => new ToHaveContainer(tohave: widget.tohave[i]));
    return new ListView(
      children: toHave,
    ); 
  }
}