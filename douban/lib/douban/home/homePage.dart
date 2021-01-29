import 'package:douban/douban/mall/provider_counter_viewmodel.dart';
import 'package:douban/douban/service/home_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_content.dart';

class DBHomePage extends StatefulWidget {
  DBHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DBHomePageState createState() => _DBHomePageState();
}

class _DBHomePageState extends State<DBHomePage> {
  GlobalKey homekey = GlobalKey();
  bool _isShowUpwardButton = false;
  ScrollController _controller = ScrollController(initialScrollOffset: 0);
  @override
  void initState() {
    super.initState();

    _controller.addListener((){
      // print("监听到滚动,ScrollOffset=${_controller.offset}");
      setState(() {
        _isShowUpwardButton = _controller.offset > 900;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ValueKey("value").runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        actions: <Widget>[
          Mycounterconsumer(),
        ],
      ),
      body: HYHomeContent(
        key: homekey,
        controller: _controller,
      ),
      floatingActionButton: _isShowUpwardButton
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                if (_controller.offset > 0) {
                  _controller.animateTo(0,
                      duration: Duration(milliseconds: 10),
                      curve: ElasticInCurve());
                }
                // print(homekey.currentWidget);
                // print(homekey.currentContext);
                // print(homekey.currentState.widget);
              })
          : null,
    );
  }
}

class Mycounterconsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZLCounterVM>(
        builder: (BuildContext context, ZLCounterVM value, Widget child) {
          return IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {
            value.counter ++;
          });
        }
    );
  }
}
