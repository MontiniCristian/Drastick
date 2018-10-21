import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/disasterCard.dart';
import '../controllers/disasterController.dart';
import '../models/disarter.dart';
import 'package:auto_size_text/auto_size_text.dart';
class DisasterInfoFrame extends StatefulWidget {
  @override
  final Disaster disaster;
  DisasterInfoFrame({@required this.disaster});
  
  _DisasterInfoFrameState createState() => new _DisasterInfoFrameState();
}

class _DisasterInfoFrameState extends State<DisasterInfoFrame> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
          children: <Widget>[
            new Card(
              elevation: 5.0,
              margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Center(
                    child: Image.asset(widget.disaster.imagePath)
                  ),
                  new LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return new Column(
                        children: <Widget>[
                          new Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Text(widget.disaster.hintDescription),
                            ),
                          ),
                          new Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                                // color: Colors.blueGrey[200],                        
                              ),
                              margin: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 10.0, right: 10.0),
                              width: constraints.maxWidth,
                              child: AutoSizeText(
                                widget.disaster.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 13.0),
                                maxLines: 100,
                              ),
                            )
                          )
                        ],
                      );
                    }
                  ),
                ],
              ),
            ),
        widget.disaster.locationPathImage.isEmpty == false ? Card(
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Where?"),
              ),
              Center(
                child: Image.asset(widget.disaster.locationPathImage)
              )
            ],
          ),
        ): null
      ],
    );
  }
}