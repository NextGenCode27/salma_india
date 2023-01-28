import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';

TextStyle textStyleLarge({Color color = fontColorLight}) => TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: color,
    );

TextStyle textStyleNormal({Color color = fontColorLight}) => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color,
    );

TextStyle textStyleMedium({Color color = fontColorLight}) => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
TextStyle textStyleSmall({Color color = fontColorLight}) => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );

TextStyle textStyleExtraSmall({Color color = fontColorLight}) => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color,
    );
