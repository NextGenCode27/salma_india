import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';

class QiblahLogo extends StatelessWidget {
  const QiblahLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: fontColorLight.withOpacity(0.2),
      ),
      child: Image.asset(
        "assets/logo/qibla.png",
        height: 50,
        width: 50,
      ),
    );
  }
}
