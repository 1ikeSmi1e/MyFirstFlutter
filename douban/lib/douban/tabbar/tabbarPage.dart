import 'package:douban/douban/group/group_page.dart';
import 'package:douban/douban/home/homePage.dart';
import 'package:douban/douban/mall/mall_page.dart';
import 'package:douban/douban/profile/profile_page.dart';
import 'package:douban/douban/subject/subject_page.dart';
import 'package:douban/key/globalkey.dart';
import 'package:douban/scroll_widget/Contacts.dart';
import 'package:douban/scroll_widget/customScrollView.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: IndexedStack(
          index: _currentIdx,
          children: <Widget>[
            DBHomePage(),
            DBSubjectPage(),
            CustomScrollPage(),
            DBMallPage(),
            DBProfilePage(),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIdx,
          type: BottomNavigationBarType.fixed,
          items: [
            DBBottomItem("home", "首页"),
            DBBottomItem("subject", "书影音"),
            DBBottomItem("group", "小组"),
            DBBottomItem("mall", "市集"),
            DBBottomItem("profile", "我的")
          ],
        onTap: (value){
            setState(() {
              _currentIdx = value;
            });
        },
      ),
    );
  }
}


//
class DBBottomItem extends BottomNavigationBarItem {
  DBBottomItem(String iconName, String title) : super(
    title: Text(title),
    icon: Image.asset("images/tabbar/${iconName}.png", width: 32,),
    activeIcon : Image.asset("images/tabbar/${iconName}_active.png", width: 32,),
  );
}
