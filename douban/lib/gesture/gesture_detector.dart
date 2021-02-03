import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  GestureDetectorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PointerEventContent(),
    );
  }
}


class PointerEventContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Listener(
            child: Container(width: 200, height: 200, color: Colors.red,),
            onPointerDown: (PointerDownEvent event){
              print('onPointerDown----->$event');
            },
            onPointerCancel: (PointerCancelEvent event){
              print('onPointerCancel----->$event');
            },
            onPointerUp: (PointerUpEvent event){
              print('PointerUpEvent----->$event');
            },
            onPointerMove: (PointerMoveEvent event){
              print('PointerMoveEvent----->$event');
            },
            onPointerSignal: (PointerSignalEvent event){
              print('PointerSignalEvent----->$event');
            },
          ),
          SizedBox(height: 15,),
          GestureDetector(
            child: Container(width: 200, height: 200, color: Colors.red,),
            onTap: (){
              print('GestureDetector---> onTap:');
            },
            onTapCancel: (){
              print('GestureDetector---> onTapCancel:');
            },
            onTapDown: (TapDownDetails details){
              print('GestureDetector---> onTapDown:$details');
            },
            onTapUp: (TapUpDetails details){
              print('GestureDetector---> onTapUp:$details');
            },
            onDoubleTap: (){
              print('GestureDetector---> onDoubleTap:');
            },
            onLongPress: (){
              print('GestureDetector---> onLongPress:');
            },
            // onVerticalDragStart: (DragStartDetails details){
            //   print('GestureDetector---> onVerticalDragStart:$details');
            // },
            // onVerticalDragUpdate: (DragUpdateDetails details){
            //   print('GestureDetector---> onVerticalDragUpdate:$details');
            // },
            onHorizontalDragStart: (DragStartDetails details){// 拖拽手势
              print('GestureDetector---> onHorizontalDragStart:$details');
            },
            onHorizontalDragUpdate: (DragUpdateDetails details){
              print('GestureDetector---> onHorizontalDragUpdate:$details');
            },
            onPanStart: (DragStartDetails details){// 平移手势
              print('GestureDetector---> onPanStart:$details');
            },
            onPanUpdate: (DragUpdateDetails details){
              print('GestureDetector---> onPanUpdate:$details');
            },

          ),
        ],
      ),
    );
  }
}
