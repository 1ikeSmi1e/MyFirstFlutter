import 'dart:ui';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

final eventBus = EventBus();

class EventBusPage extends StatefulWidget {
  EventBusPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  var  _message = 'default';
  final info = UserInfo('nickname', 5);
  @override
  void initState(){
    super.initState();
    // 监听UserInfo的变化
    eventBus.on<UserInfo>().listen((event) {
      setState(() {
        _message = '${event.nickname} + ${event.level}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_message, style: TextStyle(color: Colors.green, fontSize: 30),),
            RaisedButton(child: Text('修改UserInfo') ,onPressed: (){
              info.nickname = '${info.nickname}+1';
              info.level += 1;
              eventBus.fire(info);
            })
          ],
        ),
      ),
    );
  }
}


/// 组件之间传递的对象
class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}