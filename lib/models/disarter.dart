import './todo.dart';
import 'package:flutter/material.dart';
import './toHave.dart';
class Disaster {
  String title;
  Icon icon;
  String hintDescription;
  String imagePath;
  String description;
  String locationPathImage;
  List<Todo> todos;
  List<ToHave> toHave;
  Disaster(
    this.title,
    this.icon,
    this.hintDescription,
    this.imagePath,
    this.description,
    this.locationPathImage,
    this.todos,
    this.toHave
    );
}