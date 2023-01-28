import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.cardHeight,
    required this.child,
  }) : super(key: key);
  final double cardHeight;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        elevation: 25,
        child: Container(
          alignment: Alignment.center,
          height: cardHeight,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              gradientColor1,
              gradientColor2,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: child,
        ),
      ),
    );
  }
}
