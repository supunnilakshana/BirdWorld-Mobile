import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyComment extends StatelessWidget {
  const EmptyComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/animations/no_coments.json",
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            "No comments yet",
            style: TextStyle(
                color: AppColors.appPrimary.withOpacity(0.95),
                fontWeight: FontWeight.w800,
                fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            "Write your thoughts..",
            style: TextStyle(
                color: AppColors.appPrimary.withOpacity(0.95),
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}
