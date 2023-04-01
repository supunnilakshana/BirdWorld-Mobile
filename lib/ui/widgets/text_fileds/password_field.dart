import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';

class PrimaryPasswordformfiled extends StatefulWidget {
  final TextInputType keybordtype;
  final IconData iconData;
  final int maxLine;
  final String hintText;
  final TextEditingController controller;
  final Function(String) onchange;
  final String? Function(String?) valid;
  const PrimaryPasswordformfiled({
    this.hintText = "Password",
    Key? key,
    required this.controller,
    this.keybordtype = TextInputType.text,
    this.maxLine = 1,
    required this.iconData,
    required this.onchange,
    required this.valid,
  }) : super(key: key);

  @override
  State<PrimaryPasswordformfiled> createState() =>
      _PrimaryPasswordformfiledState();
}

class _PrimaryPasswordformfiledState extends State<PrimaryPasswordformfiled> {
  bool isHidepassword = true;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      onChanged: widget.onchange,
      controller: widget.controller,
      validator: widget.valid,
      obscureText: true,
      maxLines: widget.maxLine,
      cursorColor: AppColors.md_theme_light_primary,
      keyboardType: widget.keybordtype,
      decoration: InputDecoration(
        suffixIcon: InkWell(
            onTap: _viewPassword,
            child: const Icon(
              Icons.visibility,
              color: AppColors.md_theme_light_primary,
            )),
      ).applyDefaults(themeData.inputDecorationTheme).copyWith(
            hintText: widget.hintText,
          ),
    );
  }

  void _viewPassword() {
    if (isHidepassword == true) {
      isHidepassword = false;
    } else {
      isHidepassword = true;
    }
    setState(() {});
  }
}
