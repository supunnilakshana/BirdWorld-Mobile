import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';

class SufexTextformfiled extends StatefulWidget {
  final double radius;
  final TextInputType keybordtype;
  final bool isenable;
  final int maxLine;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final Function(String) onchange;
  final String? Function(String?) valid;
  const SufexTextformfiled({
    this.hintText = "Text",
    Key? key,
    this.isenable = true,
    this.radius = 15,
    this.keybordtype = TextInputType.number,
    this.maxLine = 1,
    required this.iconData,
    required this.controller,
    required this.onchange,
    required this.valid,
  }) : super(key: key);

  @override
  State<SufexTextformfiled> createState() => _SufexTextformfiledState();
}

class _SufexTextformfiledState extends State<SufexTextformfiled> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      readOnly: !widget.isenable,
      maxLines: widget.maxLine,
      onChanged: widget.onchange,
      controller: widget.controller,
      validator: widget.valid,
      cursorColor: AppColors.md_theme_light_primary,
      keyboardType: widget.keybordtype,
      style: const TextStyle(fontSize: 14),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        suffixIcon: Icon(
          widget.iconData,
          color: AppColors.md_theme_light_primary,
        ),
      ).applyDefaults(themeData.inputDecorationTheme).copyWith(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
    );
  }
}
