import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int _counter = 5;
 @override
  Widget build(BuildContext context) {
   return Scaffold(
 	     appBar: AppBar(
  	      title: Text(widget.title),
  	    ),
 	       body: Center(
 	           child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     CounterBtn(title: "+", bgColor: Colors.orange, onPressed: (){
                       setState(() {
                         _counter++;
                       });
                     },),
                     CounterBtn(title: "-", bgColor: Colors.blue, onPressed: (){
                       setState(() {
                         if(_counter > 0){
                           _counter--;
                         }
                       });
                     },)
                   ],
                 ),
                 Text("当前计数为：$_counter", style: TextStyle(fontSize: 25, color: Colors.red),),
               ],
             ),
            )// This trailing comma makes auto-formatting nicer for build methods.
	  );
  }
}

class CounterBtn extends StatelessWidget {
  final VoidCallback onPressed;
  String title;
  Color bgColor;

  CounterBtn({Key key, this.onPressed, this.title, this.bgColor}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(title, style:TextStyle(fontSize: 30, color: Colors.white),),
        color: bgColor ,onPressed: onPressed
    );
  }
}

