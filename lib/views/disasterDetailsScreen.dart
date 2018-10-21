import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/disasterInfoFrame.dart';
import '../widgets/todoList.dart';
import '../widgets/toHaveList.dart';

class DisasterDetailsScreen extends StatefulWidget {
  DisasterDetailsScreen({Key key, @required this.disaster}):super(key: key);
  final Disaster disaster;
  @override
  _DisasterDetailsScreenState createState() => new _DisasterDetailsScreenState();
}

class _DisasterDetailsScreenState extends State<DisasterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.disaster.title),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.check_box), text: "Todo",),
            Tab(icon: Icon(Icons.move_to_inbox), text: "ToHave",),
            Tab(icon: Icon(Icons.info), text: "Info",),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          new TodoList(todos: widget.disaster.todos),
          new TodoHaveList(tohave: widget.disaster.toHave),
          new DisasterInfoFrame(disaster: widget.disaster),
        ],
      )
    ),
    );
  }
}