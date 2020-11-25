import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  ButtonPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ButtonWidget"),
        ),
        body: Buttons(),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: () {
           print("FloatingActionButton Click");
         },
       ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("RaisedButton"),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            print("RaisedButton Click");
          },
        ),
        CustomFlatButton(),
        OutlineButton(
          child: Text("OutlineButton"),
          // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            print("OutlineButton Click");
          },
        ),
        RaisedButton(
          child: Text("立即注册", style: TextStyle(color: Colors.white)),
          color: Colors.orange, // 按钮的颜色
          highlightColor: Colors.orange[700], // 按下去高亮颜色
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // 圆角的实现
          onPressed: () {
            print("立即注册");
          },
        )
      ],
    );
  }
}

// 无边距，设置自定义最小宽度
class CustomFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 15,
      child: FlatButton(
        child: Text("FlatButton"),
        padding: EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {
          print("FlatButton Click");
        },
        color: Colors.blue,
      ),
    );
  }
}
