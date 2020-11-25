import 'package:douban/scroll_widget/customScrollView.dart';
import 'package:flutter/material.dart';

class DBGroupPage extends StatefulWidget {
  DBGroupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DBGroupPageState createState() => _DBGroupPageState();
}

class _DBGroupPageState extends State<DBGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Group"),
        ),
        body: CustomScrollPage(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}