import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  ScrollController _controller = ScrollController(initialScrollOffset: 100);
  bool _isShowUpwardButton = false;
  @override
  void initState(){
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
    return Scaffold(
      appBar: AppBar(
        title: Text("联系人列表"),
      ),
      body: Listseparated(controller: _controller,),
      floatingActionButton: _isShowUpwardButton? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
          onPressed: (){
          if(_controller.offset > 0){
            _controller.animateTo(0, duration: Duration(milliseconds: 10), curve: ElasticInCurve());
          }
          },
      ) : null,
    );
  }
}


class Listseparated extends StatelessWidget {
  final ScrollController controller;

  const Listseparated({Key key, this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification){

        if ( notification is ScrollStartNotification){
          print("${notification.metrics.pixels}");
        }else if (notification is ScrollEndNotification) {
          print("${notification.metrics.pixels}");
        }else if (notification is ScrollUpdateNotification) {
          print("${notification.metrics.pixels}");
        }else if (notification is OverscrollNotification) {
          print("${notification.metrics.pixels}");
        }else if (notification is UserScrollNotification) {
          print("${notification.metrics.pixels}");
        }
        return true;
      },
      child: ListView.separated(
        controller: controller,
          itemBuilder: (BuildContext context, int index){
            return ContactTile(index: index,);
          },
          separatorBuilder: (BuildContext context, int index){
            return Divider(thickness: 1, height: 1, endIndent: 10, indent: 10,color: Colors.lightBlueAccent,);
          },
          itemCount: 50
      ),
    );
  }
}


// 方式一
class Listgenerate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // itemExtent: 100,
      // reverse: true, // 列表从末尾开始
      children: List.generate(50, (index) {
        return ContactTile(index: index,);
      }),
    );
  }
}

class ContactTile extends StatelessWidget {
  final index;

  const ContactTile({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.people),
      trailing: Icon(Icons.delete),
      title: Text("联系人$index"),
      subtitle: Text("号码：18114356919"),
    );
  }
}


