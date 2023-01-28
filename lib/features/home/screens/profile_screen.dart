import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/features/compass/widgets/qiblah_logo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: textStyleMedium(color: fontColorDark),
          ),
        ),
        body: const Center(
          child: QiblahLogo(),
        ));
  }
}
