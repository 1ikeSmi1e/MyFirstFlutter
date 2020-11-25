import 'package:flutter/material.dart';

class DBProfilePage extends StatefulWidget {
  DBProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DBProfilePageState createState() => _DBProfilePageState();
}

class _DBProfilePageState extends State<DBProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Center(
          child: Text("hello Profile"),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}