import 'package:flutter/material.dart';

import 'checkbox/firstflutter_checkbox.dart';
import 'Columns/ShowImagesList.dart';
import 'counter/CounterPage.dart';
import 'scroll_widget/Contacts.dart';
import 'scroll_widget/customScrollView.dart';
import 'scroll_widget/grideView.dart';
import 'subWidgets/Button.dart';
import 'subWidgets/Flex.dart';
import 'subWidgets/Images.dart';
import 'subWidgets/RichText.dart';
import 'subWidgets/TextField.dart';
import 'subWidgets/formfield.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CustomScrollPage(title: "计数器页面",),
      debugShowCheckedModeBanner: false,
    );
  }
}

