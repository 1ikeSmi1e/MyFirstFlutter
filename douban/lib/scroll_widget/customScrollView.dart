import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollPage extends StatefulWidget {
  CustomScrollPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomScrollPageState createState() => _CustomScrollPageState();
}

class _CustomScrollPageState extends State<CustomScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("myCustomScrollView"),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // title: Text("SliverAppBar"),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Hello James"),
                  background: Image.asset("images/juren.jpeg", fit: BoxFit.cover,)
              ),
            ),
            MySliverGrid2(),
            MYContactsListSliver(),
          ],
        )
        );
  }
}


class MYContactsListSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("联系人$index"),
                  ),
                  Divider(thickness: 1, height: 1, endIndent: 10, indent: 10,color: Colors.lightBlueAccent,)
                ],
              );
            },
            childCount: 10
        )
    );
  }
}

class MySliverGrid2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return Container(
                    color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)));
              },
              childCount: 6
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 15
          )
      ),
    );
  }
}



class MySliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverPadding(
        padding: EdgeInsets.all(8),
        sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                  return Container(
                      color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)));
                },
                childCount: 6
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 15
            )
        ),
      ),
    );
  }
}
