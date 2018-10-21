import '../models/disarter.dart';
import 'dart:convert' as JSON;
import '../static/disasters.dart';
import '../models/todo.dart';
import '../models/toHave.dart';
import 'package:flutter/material.dart';
class Disastercontroller {
  List<Disaster> disasters = new List<Disaster>();
  Disastercontroller() {
    this.loadDisasters();
  }
  loadDisasters() {
    disasters_json.forEach((k,v) => insertDisaster(k));
  }
  // TODO: implement galleryview for multiple images
  insertDisaster(String disasterName){
    List<Todo> todos = new List<Todo>();
    List<ToHave> tohave = new List<ToHave>();
    List<Map<String, String>> currentTodos = disasters_json[disasterName]['todos'];
    currentTodos.forEach((f) => todos.add(new Todo(f['title'], f['description'], f['text'])));
    List<Map<String, Object>> currentToHave = disasters_json[disasterName]['to_have'];

    currentToHave.forEach((f) =>
      tohave.add(new ToHave(f['title'], f['icon'],f['description'], f['text']))
    );
    disasters.add(new Disaster(
      disasters_json[disasterName]['title'],
      disasters_json[disasterName]['icon'],
      disasters_json[disasterName]['hint_description'],
      disasters_json[disasterName]['image_path'],
      disasters_json[disasterName]['description'],
      disasters_json[disasterName]['locations_path_image'],
      todos,
      tohave
      )
      );
  }

  reset() {
    this.disasters = new List<Disaster>();
  }
}