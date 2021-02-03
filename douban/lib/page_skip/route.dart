import 'package:flutter/material.dart';

import 'detail_page.dart';

class RoutePage extends StatefulWidget {
  RoutePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
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
                final result = Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx){
                    return RouteDetailPage(title: '详情页',);
                  })
                );
                result.then((value){
                  print('RouteDetailPage--pop--->$value');
                  setState(() {
                    _message = value ?? 'null';
                  });
                });
              },
            ),
            Text(_message, style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}