import 'package:flutter/material.dart';

import 'CustomSearchDelegate.dart';

class DBSubjectPage extends StatefulWidget {
  DBSubjectPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DBSubjectPageState createState() => _DBSubjectPageState();
}

class _DBSubjectPageState extends State<DBSubjectPage> {
  int _counter = 0;
  String _selectedDate = "你好~";

  // mDatePicker() async {
  //   var result = await showDatePicker(
  //       locale: Localizations.localeOf(context),
  //       // selectableDayPredicate: (day){
  //       //   print(day);
  //       //   return true;
  //       // },
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2010),
  //       lastDate: DateTime(2030)
  //   );
  //   setState(() {
  //     selectedDate = result;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedDate,style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
            onPressed: () {
              // showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
          MySharePopupMenuButton()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("选择日期"),
                onPressed: (){
                  showDatePicker(
                      locale: Locale("zh"),
                      // selectableDayPredicate: (day){
                      //   print(day);
                      //   return true;
                      // },
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2030)
                  ).then((result){
                    setState(() {
                      _selectedDate = "你好，${result.year}-${result.month}-${result.day}";
                    });
                  });
            }),

            RaisedButton(
              child: Text('SimpleDialog'),
              onPressed: () async {
                var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return MySimpleDialog();
                    });
                print(result);
              },
            ),
            RaisedButton(
              child: Text('AlertDialog'),
              onPressed: () async {
                var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return MyAlertDialog();
                    });
              },
            ),
            RaisedButton(
              child: Text('ListDialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return MyDialog();
                    });
              },
            ),
            MyDropdownButton(onChanged: (){
              setState(() {
              });
            },)
          ],
        ),
      ),
    );
  }
}

class MyDropdownButton extends StatelessWidget {
  List tabs = ["最新博文", "最新项目", "最新热点"];

  final VoidCallback onChanged;
  String _selectedSort = "最新博文";
  MyDropdownButton({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedSort,
      items: tabs.map((e) {
        return DropdownMenuItem(
          child: Container(
            child: Text(e),
          ),
          value: e,
        );
      }).toList(),
      onChanged: (value) {
        _selectedSort = value;
        this.onChanged();
      },
    );
  }
}



class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
          height: 500,
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Padding(
                  child: Text(
                    '$index',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 10),
                );
              }),
        ));
  }
}



class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('提示'),
      content: Text('我是一条消息'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop("确定");
          },
          color: Colors.white,
          child: Text(
            '确定',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop("取消");
          },
          color: Colors.white,
          child: Text('取消', style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }
}

class MySimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('语言选择'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop('中文');
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '中文',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop('英文');
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('英文', style: TextStyle(fontSize: 16)),
          ),
        )
      ],
    );;
  }
}

//
class MySharePopupMenuButton extends StatelessWidget {
  List tabs = ["最新博文", "最新项目", "最新热点"];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.share,
          color: Colors.white,
        ),
        itemBuilder: (context) {
          return tabs.map((e) {
            return PopupMenuItem(
              child: Text(e),
              value: e,
            );
          }).toList();
        });
  }
}
