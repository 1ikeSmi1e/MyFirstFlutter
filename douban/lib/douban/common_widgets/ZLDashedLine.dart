import 'package:flutter/material.dart';

class ZLDashedLine extends StatelessWidget {
  final Axis direction;
  final int dotCount;
  final double width;
  final double height;
  ZLDashedLine({this.direction = Axis.horizontal,
    this.dotCount = 20,
    this.width=2,
    this.height=1
  });

  @override
  Widget build(BuildContext context) {
    return Flex(direction: direction,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotCount, (index){
        return SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(decoration: BoxDecoration(color: Colors.black45)),
        );
      }),
    );
  }
}
