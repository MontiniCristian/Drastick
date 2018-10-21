import 'package:flutter/material.dart';
import '../models/disarter.dart';
import '../views/disasterDetailsScreen.dart';
class DisasterCard extends StatefulWidget {
  final Disaster disaster;
  DisasterCard({Key key, @required this.disaster}) : super(key: key);
  
  @override
  _DisasterCardState createState() => new _DisasterCardState();
}

class _DisasterCardState extends State<DisasterCard>{
  
  @override
  Widget build(BuildContext context) {
    print(widget.disaster.title);
    return Card(
      margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: widget.disaster.icon,
            title: Text(widget.disaster.title),
            subtitle: Text(widget.disaster.hintDescription),
            trailing: FlatButton(
                  child: Icon(Icons.keyboard_arrow_right),
                  onPressed: () { 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisasterDetailsScreen(disaster: widget.disaster)),
                    );
                  },
            ),
          ),
        ],
      ),
);
}
}