import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'generate_route.dart';

class NamedRoutePage extends StatefulWidget {
  static const routeName = '/NamedRoutePage';
  NamedRoutePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NamedRoutePageState createState() => _NamedRoutePageState();
}

class _NamedRoutePageState extends State<NamedRoutePage> {
  var _message = 'default message!';
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text('进入下一页', style: TextStyle(fontSize: 20), ),
              color: Colors.black12,
              onPressed: (){
                final result = Navigator.of(context).pushNamed(RouteDetailPage.routeName, arguments: 'NamedRoutePage to detail');
                result.then((value){
                  print('RouteDetailPage--pop--->$value');
                  setState(() {
                    _message = value ?? 'null';
                  });
                });
              },
            ),
            Text(_message, style: TextStyle(fontSize: 20),),

            FlatButton(
              child: Text('进入下一页-》onGenerateRoute', style: TextStyle(fontSize: 20), ),
              color: Colors.black12,
              onPressed: (){
                final result = Navigator.of(context).pushNamed(GenerateRoutePage.routeName, arguments: 'NamedRoutePage to detail');
                result.then((value){
                  print('RouteDetailPage--pop--->$value');
                  setState(() {
                    _message = value ?? 'null';
                  });
                });
              },
            ),
            FlatButton(
              child: Text('进入下一页-》unknown', style: TextStyle(fontSize: 20), ),
              color: Colors.black12,
              onPressed: (){
                final result = Navigator.of(context).pushNamed('unknown', arguments: 'NamedRoutePage to unknown');
                result.then((value){
                  print('RouteDetailPage--pop--->$value');
                  setState(() {
                    _message = value ?? 'null';
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}