import 'package:flutter/material.dart';

import 'ZLDashedLine.dart';
import 'ZLStarRating.dart';

class StarDashedPage extends StatefulWidget {
  StarDashedPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StarDashedPageState createState() => _StarDashedPageState();
}

class _StarDashedPageState extends State<StarDashedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Star & Dashed"),
        ),
        body: Column(
          children: <Widget>[
            ZLStarRating(rating: 4, fullRating: 10.0, size: 50, count: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 320,
                    height: 100,
                    child: ZLDashedLine(direction: Axis.horizontal, dotCount: 30, width: 4,)),
              ],
            ),
            Container(
                width: 100,
                height: 200,
                child: ZLDashedLine(direction: Axis.vertical, dotCount: 20, height: 5, width: 1,)),
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}