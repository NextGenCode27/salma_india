import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: textStyleMedium(color: fontColorDark),
        ),
      ),
    );
  }
}
