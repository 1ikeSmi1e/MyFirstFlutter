
import 'package:flutter/material.dart';

import 'appstate_share.dart';

class InheritedMethod extends StatelessWidget {
  final int counter;

  const InheritedMethod({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZLCounterWidget(
      counter: counter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          MyCard1(),
          MyCard2(),
          Text("以上用InheritedWidget实现状态共享"),
        ],
      ),
    );
  }
}


class MyCard1 extends StatefulWidget {
  @override
  _MyCard1State createState() => _MyCard1State();
}

class _MyCard1State extends State<MyCard1> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("InheritedMethod->MyCard1->didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int counter = ZLCounterWidget.of(context).counter;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.lightBlue,
          child: Text("商城购物车：$counter", style: TextStyle(fontSize: 30),),
        ),
      ],
    );
  }
}

class MyCard2 extends StatefulWidget {
  @override
  _MyCard2State createState() => _MyCard2State();
}

class _MyCard2State extends State<MyCard2> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("InheritedMethod->MyCard1->didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int counter = ZLCounterWidget.of(context).counter;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.redAccent,
          child: Text("我的购物车：$counter", style: TextStyle(fontSize: 30),),
        ),
      ],
    );
  }
}




