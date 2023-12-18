import 'package:flutter/material.dart';

import '../../theme/color.dart';

class ChatCard extends StatelessWidget {
  final String title;
  final Function onPress;
  final String img;
  const ChatCard(
      {super.key,
      required this.title,
      required this.onPress,
      required this.img});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.4,
      height: size.height * 0.3,
      child: GestureDetector(
        onTap: () {
          onPress();
        },
        child: Card(
          color: AppColors.md_theme_light_background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02, horizontal: size.height * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(img, height: 100),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.double_arrow_rounded,
                  color: AppColors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
