import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_counter_viewmodel.dart';

class ProviderMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[MyCard1(), MyCard2(), MyCard3(),Text("以上使用Provider实现共享")],
    );
  }
}


class MyCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyCard1: builder----");
    int counter = Provider.of<ZLCounterVM>(context).counter;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.lightBlue,
          child: Text(
            "商城购物车：$counter",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}

class MyCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyCard2: builder----");
    int counter = Provider.of<ZLCounterVM>(context).counter;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<ZLCounterVM>(
          builder: (context, couterVM, child){
            print("MyCard2: Consumer/builder----");
            return Card(
              color: Colors.redAccent,
              child: Text(
                "我的购物车：${couterVM.counter}",
                style: TextStyle(fontSize: 30),
              ),
            );
          },
          // child: ,
        ),
      ],
    );
  }
}

class MyCard3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Selector<ZLCounterVM, ZLCounterVM>(
          shouldRebuild: (pre, next) {
            print("MyCard3: shouldRebuild----");
            return true;
          },
         selector: (context, counterVM)  {
           print("MyCard3: selector----");
           return counterVM;
         },
          builder: (BuildContext context, ZLCounterVM couterVM, Widget child){
            print("MyCard3: builder:----");
              return Card(
                color: Colors.redAccent,
                child: Text(
                  "我的购物车：${couterVM.counter}",
                  style: TextStyle(fontSize: 30),
                ),
              );
            },
        ),
      ],
    );
  }
}





