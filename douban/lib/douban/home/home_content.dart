import 'package:douban/douban/service/home_request.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';
import 'home_movie_item.dart';

class HYHomeContent extends StatefulWidget {
  final name = "周利强列表";
  final ScrollController controller;
  HYHomeContent({Key key, this.controller}) : super(key:key);
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    // 发送网络请求
    HomeRequest.requestMovieList(0).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: 20,//movies.length,
      itemBuilder: (ctx, index) {
        return HYHomeMovieItem(index: index,);
        // return HYHomeMovieItem(movies[index]);
      }
    );
  }
}
