import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';

class DisasterScreen extends StatefulWidget {
  final Disastercontroller disastercontroller = new Disastercontroller();
  @override
  _DisasterScreenState createState() => new _DisasterScreenState();
}

class _DisasterScreenState extends State<DisasterScreen> {
  @override
  Widget build(BuildContext context) {
    widget.disastercontroller.reset();
    widget.disastercontroller.loadDisasters();
    List<Disaster> disasters = widget.disastercontroller.disasters;
    final List<Widget> cards = List.generate(
      widget.disastercontroller.disasters.length, 
      (i) => new DisasterCard(disaster: widget.disastercontroller.disasters[i])
    );
    return new ListView(
      children: cards,
    ); 
  }
}