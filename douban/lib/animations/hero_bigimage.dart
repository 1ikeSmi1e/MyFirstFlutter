import 'package:flutter/material.dart';

class HeroBigImagePage extends StatefulWidget {
  HeroBigImagePage( this.imgUrl,{Key key, this.title}) : super(key: key);
  final String title;
  final String imgUrl;
  @override
  _HeroBigImagePageState createState() => _HeroBigImagePageState();
}

class _HeroBigImagePageState extends State<HeroBigImagePage> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text(widget.title ?? 'HeroBigImagePage'),
      // ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Hero(
              tag: widget.imgUrl,
              child: Image.network(widget.imgUrl, width: double.infinity, fit: BoxFit.cover,)
          ),
        ),
      ),
    );
  }
}