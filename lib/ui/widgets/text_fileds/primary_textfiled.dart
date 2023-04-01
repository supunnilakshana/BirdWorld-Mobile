import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';

class Primarytextformfiled extends StatelessWidget {
  final TextInputType keybordtype;
  final int maxLine;

  final String hintText;
  final String formControlName;
  final Color background;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final Function(String) onchange;
  final String? Function(String?) valid;
  const Primarytextformfiled({
    this.hintText = "Text",
    Key? key,
    required this.controller,
    this.keybordtype = TextInputType.text,
    this.maxLine = 1,
    required this.formControlName,
    this.background = AppColors.light_gray,
    this.padding = const EdgeInsets.all(10),
    required this.onchange,
    required this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      onChanged: onchange,
      controller: controller,
      validator: valid,
      maxLines: maxLine,
      cursorColor: AppColors.md_theme_light_primary,
      keyboardType: keybordtype,
      decoration: const InputDecoration()
          .applyDefaults(themeData.inputDecorationTheme)
          .copyWith(hintText: hintText),
    );
  }
}
