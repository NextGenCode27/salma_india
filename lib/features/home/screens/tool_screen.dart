import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/features/compass/screens/qibla_screen.dart';
import 'package:salam_india/features/home/widgets/tools_card.dart';

class ToolScreen extends StatelessWidget {
  const ToolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            centerTitle: true,
            title: Text(
              "Tools",
              style: textStyleMedium(color: fontColorDark),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ToolsCard(
                  title: "Mosque Finder",
                  description: "Find your nearest Mosque",
                  buttonName: "Find",
                  image: "assets/logo/logo.png",
                  onPressed: () {},
                ),
                ToolsCard(
                  title: "Qibla Compass",
                  description: "Get direction of the qibla",
                  buttonName: "Get direction",
                  image: "assets/images/compass.png",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QiblahScreen(),
                      ),
                    );
                  },
                ),
                ToolsCard(
                  title: "Halal Finder",
                  description: "Find halal products",
                  buttonName: "Find",
                  image: "assets/images/book.png",
                  onPressed: () {},
                ),
                ToolsCard(
                  title: "Tasbeeh Counter",
                  description: "Count tasbeeh ",
                  buttonName: "Start Count",
                  image: "assets/images/tasbeeh.png",
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
