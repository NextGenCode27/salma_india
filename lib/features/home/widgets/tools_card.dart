import 'package:flutter/material.dart';
import 'package:salam_india/constants/color_const.dart';
import 'package:salam_india/constants/font_style.dart';
import 'package:salam_india/widgets/custom_card.dart';

class ToolsCard extends StatelessWidget {
  const ToolsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String description;
  final String image;
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      cardHeight: 200,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: textStyleLarge(color: fontColorLight),
                  ),
                  Text(
                    description,
                    style:
                        textStyleSmall(color: fontColorLight.withOpacity(0.4)),
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      buttonName,
                      style: textStyleNormal(color: fontColorDark),
                    ),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage(image),
              height: 120,
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}
