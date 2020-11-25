import 'package:flutter/material.dart';

class ImgPage extends StatefulWidget {
  ImgPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ImgPageState createState() => _ImgPageState();
}

class _ImgPageState extends State<ImgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image加载"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: 300,
                color: Colors.yellow,
                child: FadeNetImage(),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CirleAvatarWidget(),
                  ClipOval(
                    child: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                    width: 100,
                      height: 100,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 200,
                width: 300,
                color: Colors.yellow,
                child: LocalImageAsset(),
              ),
              Icon(Icons.pets, size: 50, color: Colors.blue,),
              Text("Baidu")
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class CirleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
        child: Container(
            alignment: Alignment(0, .5),
            width: 100,
            height: 100,
            child: Text("CircleAvatar")
        ),
      ),
    );
  }
}


class LocalImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final img = Image.asset("images/bintree.png");
    return Image.asset("images/test_local.png",
    width: 300,
    alignment: Alignment.bottomCenter,
    fit: BoxFit.fitWidth,);
  }
}


class FadeNetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeInDuration: Duration(seconds: 3),
        placeholder:AssetImage("images/test_local.png"),
        image:  NetworkImage("http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg"));
  }
}


class Network_Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network("http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
      width: 250,
      alignment: Alignment.bottomCenter,
      repeat: ImageRepeat.repeatY,
      fit: BoxFit.fitWidth,
      color: Colors.red,
      colorBlendMode: BlendMode.softLight,
    );
  }
}
