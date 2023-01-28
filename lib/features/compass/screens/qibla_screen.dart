import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/features/compass/widgets/compass_widget.dart';
import 'package:salam_india/features/compass/widgets/qiblah_logo.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: fontColorLight,
          ),
        ),
        title: Text(
          "Qiblah Compass",
          style: textStyleMedium(color: fontColorLight),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mosque1.png"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
          gradient: LinearGradient(
            colors: [
              gradientColor1,
              gradientColor2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder(
          stream: FlutterQiblah.qiblahStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ));
            }

            final qiblahDirection = snapshot.data;

            animation = Tween(
                    begin: begin,
                    end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                .animate(_animationController!);
            begin = (qiblahDirection.qiblah * (pi / 180) * -1);
            _animationController!.forward(from: 0);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const QiblahLogo(),
                        Text(
                          "Qiblah Defined",
                          style: textStyleNormal(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 370,
                    child: AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                        angle: animation!.value,
                        child: const QiblahCompassWidget(),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
