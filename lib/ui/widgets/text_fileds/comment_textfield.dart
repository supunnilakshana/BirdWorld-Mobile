import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';

class Commenttextformfiled extends StatefulWidget {
  final TextInputType keybordtype;
  final int? maxLine;
  final Widget leading;
  final Widget? suffex;
  final String hintText;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final Function(String) onchange;
  final String? Function(String?) valid;
  const Commenttextformfiled({
    this.hintText = "Text",
    Key? key,
    this.keybordtype = TextInputType.text,
    this.maxLine,
    this.padding = const EdgeInsets.all(10),
    required this.leading,
    required this.controller,
    required this.onchange,
    required this.valid,
    this.suffex,
  }) : super(key: key);

  @override
  State<Commenttextformfiled> createState() => _CommenttextformfiledState();
}

class _CommenttextformfiledState extends State<Commenttextformfiled> {
  late bool isEditText;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      onChanged: widget.onchange,
      controller: widget.controller,
      validator: widget.valid,
      maxLines: widget.maxLine,
      cursorColor: AppColors.md_theme_light_font,
      keyboardType: widget.keybordtype,
      decoration: InputDecoration(
        suffixIcon: widget.suffex,
        icon: widget.leading,
      ).applyDefaults(themeData.inputDecorationTheme).copyWith(
          hintText: widget.hintText,
          border: InputBorder.none,
          fillColor: AppColors.white,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none),
    );
  }
}
