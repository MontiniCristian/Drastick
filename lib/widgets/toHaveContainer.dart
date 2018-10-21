import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';
import '../models/toHave.dart';
import 'package:auto_size_text/auto_size_text.dart';
class ToHaveContainer extends StatefulWidget {
  final ToHave tohave;
  ToHaveContainer({@required this.tohave});

  @override
  _ToHaveContainerState createState() => new _ToHaveContainerState();
}

class _ToHaveContainerState extends State<ToHaveContainer> {
  
  bool _value = false;
  _valueChanged(bool _value) => setState(() => _value = _value);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          widget.tohave.description.isNotEmpty == true ? ListTile(
            leading: new Checkbox(value: _value ,onChanged: (bool value) {
              setState(() {
                _value = value;
              });
            }),
            title: AutoSizeText(
              widget.tohave.title,
              maxLines: 3,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
            subtitle: new AutoSizeText(
              widget.tohave.description,
              maxLines: 10,
              style: TextStyle(
                fontSize: 8.0
              ),
            ),
            trailing: widget.tohave.icon,
          ): ListTile(
            leading: new Checkbox(value: _value ,onChanged: (bool value) {
              setState(() {
                _value = value;
              });
            }),
            title: AutoSizeText(
              widget.tohave.title,
              maxLines: 3,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
            trailing: widget.tohave.icon,
          ),
        ],
      ),
    );  
  }
}