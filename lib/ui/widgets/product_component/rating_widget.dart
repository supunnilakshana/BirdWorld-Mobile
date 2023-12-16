import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key, required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 19, color: AppColors.appPrimary),
        4.widthBox,
        '($rating)'.text.sm.softWrap(true).make(),
      ],
    );
  }
}
