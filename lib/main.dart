import 'dart:async';

import 'package:flutter/material.dart';
import './views/disasterScreen.dart';
import 'controllers/disasterController.dart';
import './views/developerScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Drastick',
      debugShowCheckedModeBanner: false ,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blueGrey[200],
        brightness: Brightness.dark
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new MyHomePage(title: "Drastick",),
      '/ReportBug': (BuildContext context) => new DeveloperScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final drawerItems = [
    new DrawerItem("Disasters", Icons.notification_important),
    new DrawerItem("Media (Not working)", Icons.perm_media),
    new DrawerItem("Statics (Not working)", Icons.pie_chart)
  ];
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDrawerIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Center(
          child: new DisasterScreen()
        );
      case 1:
        return null;
      case 2:
        return null;

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
}

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }
    drawerOptions.add(Divider());
    drawerOptions.add(
      new ListTile(
        leading: new Icon(Icons.bug_report),
        title: new Text("Report bugs"),
        onTap: () => Navigator.of(context).pushNamed('/ReportBug'),
      )
    );
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Builder(builder: (context){
              return new IconButton(onPressed: () {Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu),);
            })
            
          ],
        ),
      ),
      floatingActionButton: new Builder(builder: (context) {
      return new FloatingActionButton(
        elevation: 10.0,
        child: Icon(Icons.notifications_active),
        onPressed: () {},
      );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    Container(
                      color: Colors.black12,
                      child:  Image.asset('./lib/assets/nasa-logo-web-rgb.png')
                    ),
                  ],
                )
              ),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex)
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Column(
          children: <Widget>[
            Expanded(
              child: Center()
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Image.asset('./lib/assets/nasa-logo-web-rgb.png'),
                  Text("Disaster Recovery App")
                ],
              )
            ),
            Expanded(
              child: Center(),
            ),
          ],
        )
      ),
    );
  }
}