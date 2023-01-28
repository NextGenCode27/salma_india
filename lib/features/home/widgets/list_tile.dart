import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';

class ListTilePrayer extends StatelessWidget {
  const ListTilePrayer({
    Key? key,
    required this.namazName,
    required this.namazTime,
  }) : super(key: key);
  final String namazName;
  final String namazTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.mosque,
        color: iconColor,
      ),
      title: Text(
        namazName,
        style: textStyleNormal(color: fontColorDark),
      ),
      trailing: Text(
        namazTime,
        style: textStyleSmall(color: fontColorDark),
      ),
    );
  }
}
