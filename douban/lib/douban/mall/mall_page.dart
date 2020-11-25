import 'package:douban/douban/mall/appstate_share.dart';
import 'package:douban/douban/mall/provider_counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Inherited_method.dart';
import 'provider_mothod.dart';

class DBMallPage extends StatefulWidget {
  DBMallPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DBMallPageState createState() => _DBMallPageState();
}

class _DBMallPageState extends State<DBMallPage> {
  int _counter = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("State Shared"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add,color: Colors.white,size: 32,),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            InheritedMethod(counter: _counter,),
            SizedBox(height: 40,),
            ProviderMethod(),
          ],
        ),
      floatingActionButton: Selector<ZLCounterVM, ZLCounterVM>(
            child: Icon(Icons.add),
          builder: (ctx, couterVM, child){
            return FloatingActionButton(
                child: child,
                onPressed: (){
                  couterVM.counter ++;
                });
          },
          selector: (ctx, couterVM) => couterVM,
        shouldRebuild: (pre, next) => false,
      ),
    );
  }
}

