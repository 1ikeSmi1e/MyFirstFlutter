
import 'package:flutter/material.dart';

class ZLStarRating extends StatefulWidget {
  final double rating;
  final double fullRating;
  final int count;
  final Color unSelectedColor;
  final Color selectedColor;
  final double size;
  final Widget unselectedImage;
  final Widget selectedImage;

  ZLStarRating({
    @required this.rating,
    this.fullRating = 10.0,
    this.count = 5,
    this.unSelectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    this.size = 30.0,
    Widget unselectedImage,
    Widget selectedImage,
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unSelectedColor, size: size),
  selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _ZLStarRatingState createState() => _ZLStarRatingState();
}

class _ZLStarRatingState extends State<ZLStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 1.未选中星
        Row(
          mainAxisSize: MainAxisSize.min,
          children:buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children:buildSelectedStar(),
        )
        // 2.选中星
      ],
    );
  }


  List<Widget> buildUnselectedStar(){
    return List.generate(widget.count, (index){
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar(){
    List<Widget> stars = [];
    final star = widget.selectedImage;
    // 1.构建不需要裁剪的满的星
    int count = 0;
    double oneValue = widget.fullRating / widget.count;
    if (widget.rating > widget.fullRating){
      count = widget.count;
    }else{
      count = (widget.rating/oneValue).floor();
    }
    for (int i = 0; i < count; i++){
      stars.add(star);
    }

    // 2.裁剪最后一颗星
    double percent = widget.rating/oneValue - count ;
    if (percent == 0) return stars;

    final halfStar = ClipRect(
      child: star,
      clipper: ZLStarClipper(percent),
    );
    stars.add(halfStar);

    return stars;
  }
}

class ZLStarClipper extends CustomClipper<Rect> {
  final double percent;

  ZLStarClipper(this.percent);

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    print("ZLStarClipper: ${size.width}, $percent");
    return Rect.fromLTRB(0, 0, size.width * percent, size.height);
  }

  @override
  bool shouldReclip(ZLStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.percent != percent;
  }
}
