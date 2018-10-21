
import 'package:flutter/material.dart';


class DeveloperScreen extends StatefulWidget {
  @override
  _DeveloperScreenState createState() => new _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Developer Contacts"),
      ),
      body: new Column(
        children: <Widget>[
          Expanded(
            child: new Container(),
          ),
          Expanded(
            child: new Container(
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.account_circle),
                            title: Text("Montini Cristian"),
                          ),
                          ListTile(
                            leading: Icon(Icons.mail),
                            title: Text("montinicristian@gmail.com"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("3337298262"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: new Container(),
          ),
        ],
      ),
    );
  }
}