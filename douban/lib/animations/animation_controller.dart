import 'package:flutter/material.dart';

class AnimationCtl extends StatefulWidget {
  AnimationCtl({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AnimationCtlState createState() => _AnimationCtlState();
}

class _AnimationCtlState extends State<AnimationCtl>  with SingleTickerProviderStateMixin{
  AnimationController animationCtl;
  Animation<double> animation;

  @override
  void initState(){
    super.initState();
    // 1.创建AnimationController
    animationCtl =  AnimationController(duration: Duration(seconds: 1), vsync: this);
    // 2.动画添加Curve效果
    animation = CurvedAnimation(
        parent: animationCtl, curve: Curves.elasticInOut, reverseCurve: Curves.easeOut
    );
    // 3.监听动画
    animation.addListener(() {
      setState(() {
      });
    });
    // 4.控制动画的翻转
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed || status == AnimationStatus.reverse){
        print('$status');
        animationCtl.reverse();
      }else if(status == AnimationStatus.dismissed || status == AnimationStatus.forward){
        print('$status');
        animationCtl.forward();
      }
    });
    // 5.设置值的范围
    animation = Tween(begin: 50.0, end: 120.0).animate(animationCtl);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: animation.value,),
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
