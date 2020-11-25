import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({this.title});

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text(this.widget.title),
          ),
          body: HomePageBody()
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePageBody> {

  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(value: flag, onChanged: (value) {
                setState(() {
                  flag = value;
                  // print(value);
                });
              }),

              Text("我同意《Stock用户使用协议》",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

