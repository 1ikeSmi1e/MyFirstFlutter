import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ShopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表",),
      ),
      body: ShopsContent(),
    );
  }
}

class ShopsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(

      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ShopsItem(title: "商品1", desc: "这是一本书，叫MacBook", imgUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg",),
        SizedBox(height: 8,),
        ShopsItem(title: "商品2", desc: "这是iphone，iphone", imgUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg",),
        SizedBox(height: 8,),
        ShopsItem(title: "商品3", desc: "这是ipad，iphone", imgUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg",)
      ],

    );
  }
}

class ShopsItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imgUrl;

  const ShopsItem({Key key, this.title, this.desc, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black12, width: 2)) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(color: Colors.black, fontSize: 24),),
          Text(desc, style: TextStyle(color: Colors.black45, fontSize: 18),),
          Image.network(imgUrl)
        ],
      ),
    );
  }
}

