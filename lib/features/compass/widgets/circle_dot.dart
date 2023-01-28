import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';

class CircleDotWidget extends StatelessWidget {
  const CircleDotWidget({
    Key? key,
    required this.alignment,
    this.height = 30,
    this.width = 30,
  }) : super(key: key);
  final AlignmentGeometry alignment;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: fontColorDisabled.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
