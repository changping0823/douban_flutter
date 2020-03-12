import 'package:flutter/material.dart';


class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  DashedLine(
    {this.axis = Axis.horizontal,
    this.dashedHeight = 1,
    this.dashedWidth = 1,
    this.color = const Color(0xff888888),
    this.count = 10}
  );


  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index){
        return Container(width: dashedWidth,height: dashedHeight,color: color);
      })
    );
  }
}