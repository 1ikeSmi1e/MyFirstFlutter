import 'package:flutter/material.dart';
import 'hero_bigimage.dart';

class HeroAnimationPage extends StatefulWidget {
  HeroAnimationPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
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
      body: HeroContent(),
    );
  }
}

class HeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2
        ),
            children: List.generate(20, (index){
              String imgUrl = 'https://picsum.photos/id/$index/400/200';

              return GestureDetector(
                onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){

                        return FadeTransition(opacity: animation, child: HeroBigImagePage(imgUrl),);
                      },
                      fullscreenDialog: true // 是否以modal方式弹出
                      )
                    );
                },
                child: Hero(tag: imgUrl, child: Image.network(imgUrl, )),
              );
            }),
    );
  }
}
