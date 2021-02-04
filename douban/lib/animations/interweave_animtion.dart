import 'dart:math';

import 'package:flutter/material.dart';

class InterweavePage extends StatefulWidget {
  InterweavePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _InterweavePageState createState() => _InterweavePageState();
}

class _InterweavePageState extends State<InterweavePage> with SingleTickerProviderStateMixin{
  AnimationController animationCtl;
  Animation animation;
  Animation<double> sizeAnim;
  Animation<Color> colorAnim;
  Animation<double> rotationAnim;
  @override
  void initState(){
    super.initState();
    // 1.创建AnimationController
    animationCtl =  AnimationController(duration: Duration(seconds: 1), vsync: this);
    // 2.动画添加Curve效果
    animation = CurvedAnimation(
        parent: animationCtl, curve: Curves.linear, reverseCurve: Curves.linear
    );
    // 3.控制动画的翻转
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed || status == AnimationStatus.reverse){
        print('$status');
        animationCtl.reverse();
      }else if(status == AnimationStatus.dismissed || status == AnimationStatus.forward){
        print('$status');
        animationCtl.forward();
      }
    });
    // 4.设置各个子动画值的范围
    colorAnim = ColorTween(begin: Colors.blue, end: Colors.red).animate(animation);
    sizeAnim = Tween(begin: 0.0, end: 200.0).animate(animation);
    rotationAnim = Tween(begin: 0.0, end: pi*2).animate(animation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (ctx, child){
            return Opacity(
                opacity: animation.value,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(animation.value),
                child: Container(
                  width: sizeAnim.value,
                  height: sizeAnim.value,
                  color: colorAnim.value,
                  // alignment: Alignment.center,
                ),
              ),
            );
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled, color: Colors.white),
        onPressed: (){
          if (animationCtl.isAnimating){
            animationCtl.stop(canceled: false);
          }else{ // 需要根据上一次的位置继续动画
            (animationCtl.status == AnimationStatus.reverse) ? animationCtl.reverse() : animationCtl.forward() ;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationCtl.dispose();
    super.dispose();
  }
}