import 'package:douban/key/globalkey.dart';
import 'package:douban/page_skip/detail_page.dart';
import 'package:douban/page_skip/generate_route.dart';
import 'package:douban/page_skip/named_route.dart';
import 'package:douban/page_skip/route.dart';
import 'package:douban/page_skip/unknown_page.dart';
import 'package:flutter/material.dart';

import 'animations/animate_widget.dart';
import 'animations/animated_builder.dart';
import 'animations/animation_controller.dart';
import 'animations/hero_animation.dart';
import 'animations/interweave_animtion.dart';
import 'checkbox/firstflutter_checkbox.dart';
import 'Columns/ShowImagesList.dart';
import 'counter/CounterPage.dart';
import 'douban/common_widgets/Star_DashedPage.dart';
import 'gesture/eventbus_usage.dart';
import 'gesture/gesture_detector.dart';
import 'key/localkey.dart';
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
      // initialRoute: NamedRoutePage.routeName,
      routes: {
        NamedRoutePage.routeName: (ctx) => NamedRoutePage(title: "命名路由页面",),
        RouteDetailPage.routeName: (ctx) => RouteDetailPage(title: "详情页面",),
      },
      onGenerateRoute: (RouteSettings settings){
        if (settings.name == GenerateRoutePage.routeName){
          return MaterialPageRoute(
              builder: (ctx){
                return GenerateRoutePage(settings.arguments);
              });
        }else{
          return null;
        }
      },
      onUnknownRoute: (RouteSettings settings){
      return MaterialPageRoute(builder: (ctx){
        return UnknownPage(title: settings.arguments,);
      });
      },
      // home: HYLocalkeyPage(),
      home: HeroAnimationPage(title: "计数器页面",),
      debugShowCheckedModeBanner: false,
    );
  }
}

