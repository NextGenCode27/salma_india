import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/features/compass/widgets/circle_dot.dart';
import 'package:salam_india/features/compass/widgets/qiblah_logo.dart';

class QiblahCompassWidget extends StatelessWidget {
  const QiblahCompassWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 350,
      width: 350,
      decoration: BoxDecoration(
        color: iconColor,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: iconColor, blurRadius: 20, spreadRadius: 5),
        ],
        border: Border.all(
          width: 10,
          color: fontColorDisabled.withOpacity(0.3),
        ),
      ),
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.topCenter,
            child: QiblahLogo(),
          ),
          Padding(
            padding: EdgeInsets.all(42.0),
            child: CircleDotWidget(
              alignment: Alignment.topLeft,
              height: 15,
              width: 15,
            ),
          ),
          CircleDotWidget(
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: EdgeInsets.all(42.0),
            child: CircleDotWidget(
              alignment: Alignment.topRight,
              height: 15,
              width: 15,
            ),
          ),
          CircleDotWidget(
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.all(42.0),
            child: CircleDotWidget(
              alignment: Alignment.bottomLeft,
              height: 15,
              width: 15,
            ),
          ),
          CircleDotWidget(
            alignment: Alignment.centerLeft,
          ),
          CircleDotWidget(
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: EdgeInsets.all(42.0),
            child: CircleDotWidget(
              alignment: Alignment.bottomRight,
              height: 15,
              width: 15,
            ),
          ),
        ],
      ),
    );
  }
}
