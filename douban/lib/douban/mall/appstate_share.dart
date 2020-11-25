// 项目中的状态数据共享：

import 'package:flutter/material.dart';

class ZLCounterWidget extends InheritedWidget{
  // 1.共享的数据
  final counter;

  // 2.定义构造方法
  ZLCounterWidget({this.counter, Widget child}) : super(child:child);

  // 3.获取组件最近的当前InheritedWidget
  static ZLCounterWidget of(BuildContext ctx){
    return ctx.dependOnInheritedWidgetOfExactType();
  }

  // 4.这里返回值决定要不要回调State中的didChangeDependencies方法
  @override
  bool updateShouldNotify(ZLCounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.counter != counter;
  }

}

