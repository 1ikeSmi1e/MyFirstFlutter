import 'dart:math';
import 'package:flutter/material.dart';

class MyGridePage extends StatefulWidget {
  MyGridePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyGridePageState createState() => _MyGridePageState();
}

class _MyGridePageState extends State<MyGridePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GrideView"),
        ),
        body: Column(
          children: <Widget>[
            Container(
                height: 270,
                child: Grid3()),
            Text("设置了一行排3个"),
            Container(
                height: 270,
                child: Gride2()),
            Text("设置了最大宽度220"),
            Container(
              height: 100,
              child: GridView.count(crossAxisCount: 6,
                children: List.generate(50, (index) {
                  return Container(
                    color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
                  );
                }),
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Grid3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4/5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 15
    ),
    itemCount: 20,
    itemBuilder: (BuildContext context, int index){
      return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)));
    }
    );

  }
}


class Gride2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 4/2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 15
         ),
        children: List.generate(30, (index){
          return Container(
              color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256))
          );

          }),
      ),
    );
  }
}


class Gride1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 4/2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 15
      ),
        children: List.generate(50, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          );
        }
        ),
      ),
    );
  }
}
