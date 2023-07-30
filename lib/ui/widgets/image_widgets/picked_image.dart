import 'dart:io';

import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';

class PickedImage extends StatelessWidget {
  final double height;
  final double width;
  final String path;
  final Function() clearfun;
  const PickedImage({
    Key? key,
    required this.path,
    required this.clearfun,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.file(
              File(path),
              height: height,
              width: width,
            ),
          ),
          Positioned(
              right: -2,
              top: -9,
              child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: AppColors.darkBlue.withOpacity(0.7),
                    size: 20,
                  ),
                  onPressed: () {
                    clearfun();
                  }))
        ],
      ),
    );
  }
}
