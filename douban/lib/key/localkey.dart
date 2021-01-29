import 'dart:math';

import 'package:flutter/material.dart';

class HYLocalkeyPage extends StatefulWidget {
  @override
  _HYLocalkeyPageState createState() => _HYLocalkeyPageState();
}

class _HYLocalkeyPageState extends State<HYLocalkeyPage> {
  List<String> names = ["aaa", "bbb", "ccc","dddd", ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Key"),
      ),
      body: ListView(
        children: names.map((name) {
          // return ListItemFul(name, key: ValueKey(Random().nextInt(1000)),);
          // return ListItemFul(name, key: ValueKey(name));
          // return ListItemFul(name, key: UniqueKey());
          return ListItemFul(name, key: ObjectKey(name));
        }).toList(),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              names.removeAt(0);
            });
          }
      ),
    );
  }
}

// 使用StatefulWidget来生成的视图，在buide时，会根据key和runtimetype来判断是否需要重新刷新elementt tree
class ListItemFul extends StatefulWidget {
  final String name;
  ListItemFul(this.name, {Key key}): super(key: key);
  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Text(widget.name),
      color: randomColor,
    );
  }
}

// 用StatelessWidget来生成的视图，调用build会重新生成elementt tree
class ListItemLess extends StatelessWidget {
  final String name;
  final Color randomColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Text(name),
      color: randomColor,
    );
  }
}
