import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  UnknownPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('页面跳转错误: UnknownPage', style: TextStyle(fontSize: 30, color: Colors.red),),
      ),
    );
  }
}