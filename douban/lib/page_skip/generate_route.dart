import 'package:flutter/material.dart';

class GenerateRoutePage extends StatefulWidget {
  static const String routeName = '/GenerateRoutePage';
  final String title;

  GenerateRoutePage(this.title, {Key key}) : super(key: key);

  @override
  _GenerateRoutePageState createState() => _GenerateRoutePageState();
}

class _GenerateRoutePageState extends State<GenerateRoutePage> {
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
        child: Text(widget.title, style: TextStyle(fontSize: 30, color: Colors.red),),
      ),
    );
  }
}