import 'dart:math';

import 'package:douban/douban/common_widgets/ZLDashedLine.dart';
import 'package:douban/douban/common_widgets/ZLStarRating.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;
final int index;
  HYHomeMovieItem({this.movie, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter(),
        ],
      ),
    );
  }

  // 1.头部的布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${index+1}"/*"No.${movie.rank}"*/,
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 2.内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
        SizedBox(
          width: 8,
        ),
        buildContentLine(),
        SizedBox(
          width: 8,
        ),
        buildContentWish()
      ],
    );
  }

  // 2.1.内容的图片
  Widget buildContentImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset("images/home/Shawshank.png",
            height: 150,),
        // child: Image.network(
        //   movie.imageURL,
        //   height: 150,
        );
  }

  // 2.2.内容的信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(
            height: 8,
          ),
          buildContentInfoRate(),
          SizedBox(
            height: 8,
          ),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(children: [
        WidgetSpan(
          child: Icon(
          Icons.play_circle_outline,
          color: Colors.pink,
          size: 40,
          ),
          baseline: TextBaseline.ideographic,
          alignment: PlaceholderAlignment.middle
        ),
        WidgetSpan(child: Text("肖生克的救赎", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: PlaceholderAlignment.middle),
        WidgetSpan(child: Text("(1994)"), style: TextStyle(fontSize: 18, color: Colors.grey))
        // WidgetSpan(child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: PlaceholderAlignment.middle),
        // WidgetSpan(child: Text("(${movie.playDate})"), style: TextStyle(fontSize: 18, color: Colors.grey))
      ])
    );
  }

  Widget buildContentInfoRate() {
    double rating = Random().nextInt(100)/10.0;
    return Row(
      children: <Widget>[
        ZLStarRating(
          rating: 8.7,//movie.rating,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "${8.7}",//"${movie.rating}",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Widget buildContentInfoDesc() {
    // 1.字符串拼接
    // final genresString = movie.genres.join(" ");
    // final directorString = movie.director.name;
    // List<Actor> casts = movie.casts;
    // final actorString = movie.casts.map((item) => item.name).join(" ");

    final genresString = "剧情 / 犯罪";
    final directorString = "弗兰克·德拉邦特";
    // List<Actor> casts = movie.casts;
    final actorString = "蒂姆·罗宾斯 摩根·弗里曼 鲍勃·冈顿 威廉姆·赛德勒 克兰西·布朗 吉尔·贝罗斯 马克·罗斯顿 ";

    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  // 2.3.内容的虚线
  Widget buildContentLine() {
    return Container(
      height: 100,
      child: ZLDashedLine(
        direction: Axis.vertical,
        width: .4,
        height: 6,
        dotCount: 10,
        // colo: Colors.pink,
      ),
    );
  }

  // 2.4.内容的想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/home/wish.png"),
          Text(
            "想看",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 235, 170, 60)
            ),
          )
        ],
      ),
    );
  }

  // 3.尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "The Shawshank Redemption",// movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}
