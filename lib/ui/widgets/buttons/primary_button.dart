import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:flutter/material.dart';

class Primarybutton extends StatelessWidget {
  final Color color;
  final Color textcolor;
  final String text;
  final double width;
  final double heigt;
  final Function onpress;
  const Primarybutton({
    this.color = AppColors.appPrimary,
    this.textcolor = AppColors.light_gray,
    this.text = "Button",
    Key? key,
    required this.onpress,
    this.width = 200,
    this.heigt = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
      width: width,
      height: heigt,
      child: ElevatedButton(
        onPressed: () {
          onpress();
        },
        style: themeData.elevatedButtonTheme.style!
            .copyWith(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(
          text,
          style: AppStyle.elevateButtonText.copyWith(color: textcolor),
        ),
      ),
    );
  }
}
