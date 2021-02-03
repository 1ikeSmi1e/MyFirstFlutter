import 'package:flutter/material.dart';

class RouteDetailPage extends StatefulWidget {
  static const routeName = '/RouteDetailPage';
  RouteDetailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RouteDetailPageState createState() => _RouteDetailPageState();
}

class _RouteDetailPageState extends State<RouteDetailPage> {
  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop('WillPopScope');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // leading: BackButton(
          //   color: Colors.blue,
          // ),
          // iconTheme: IconThemeData(
          //   color: Colors.green,
          // ),
          // leading: new IconButton(
          //   icon: new Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          //   highlightColor: Colors.transparent,
          // ),
        ),
        body: Column(
          children: [
            Text(message??'null', style: TextStyle(fontSize: 20),),
            RouteDetailPageBody(),
          ],
        ),
      ),
    );
  }
}

class RouteDetailPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text('返回上一页', style: TextStyle(fontSize: 20), ),
        color: Colors.black12,
        onPressed: (){
          Navigator.of(context).pop('RouteDetailPage pop message!');
          print('返回上一页');
        },
      ),
    );
  }
}
