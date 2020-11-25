import 'package:flutter/material.dart';

class FlexPage extends StatefulWidget {
  FlexPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FlexPageState createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row-Column-Expand-Stack"),
        ),
        body: Center(
          child: Column(
              children: <Widget>[
                MyRow(),
                SizedBox(height: 15,),
                MyStack(),
              ],

          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}


// 堆叠
class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          color: Colors.purple,
          width: 300,
          height: 300,
        ),
        Positioned(
            left: 20,
            top: 20,
            child: Icon(Icons.favorite, size: 50, color: Colors.white)
        ),
        Positioned(
          bottom: 20,
          right: -20,
          child: Text("你好啊，李银河", style: TextStyle(fontSize: 20, color: Colors.blue)),
        )
      ],
    );
  }
}


class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
            child: Container(color: Colors.red, width: 60, height: 60)
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
            flex:1,
            child: Container(color: Colors.orange, width: 100, height: 100)
        ),
      ],
    );
  }
}
