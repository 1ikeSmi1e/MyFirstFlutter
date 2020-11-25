import 'package:flutter/material.dart';

class TextWidgetPage extends StatefulWidget {
  TextWidgetPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TextWidgetPageState createState() => _TextWidgetPageState();
}

class _TextWidgetPageState extends State<TextWidgetPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("TextWidget"),
        ),
        body: Column(
          children: <Widget>[
            PlainText(),
            SizedBox(height: 30,),
            RichText(),
          ],
        )
    );
  }
}

// class MyHomeBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         children: [
//           TextSpan(text: "《定风波》", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
//           TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
//           TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
//         ],
//       ),
//       style: TextStyle(fontSize: 20, color: Colors.purple),
//       textAlign: TextAlign.center,
//     );
//   }
// }

class RichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(text: "《定风波》",  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
        TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
        TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。"
        ),
      ],
      style: TextStyle(fontSize: 20, color: Colors.purple),
    ),
    textAlign: TextAlign.center,);
  }
}



class PlainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        color: Colors.purple,
      ),
    );
  }
}
