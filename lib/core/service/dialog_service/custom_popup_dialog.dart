import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';

class CustomPopupDialog {
  static showPopupDialog(BuildContext context, String titel, String description,
      Function actionFun) {
    AwesomeDialog(
            desc: description,
            title: titel,
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.scale,
            btnCancelText: "Cancel",
            btnOkText: "Ok",
            btnCancelOnPress: () {
              Navigator.pop(context);
            },
            btnOkOnPress: () {
              actionFun();
            },
            btnOkColor: AppColors.appPrimary,
            btnCancelColor: Colors.grey)
        .show();
  }

  static showPopupWarning(BuildContext context, String titel,
      String description, Function actionFun) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: titel,
      btnCancelText: "No",
      btnOkText: "Yes",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        actionFun();
      },
    ).show();
  }

  static showPopupLogout(BuildContext context, String title, String description,
      Function actionFun) {
    AwesomeDialog(
      context: context,
      titleTextStyle: const TextStyle(color: AppColors.md_theme_light_font),
      descTextStyle: const TextStyle(color: AppColors.md_theme_light_font),
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnCancelText: "No",
      btnOkText: "Yes",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        actionFun();
      },
    ).show();
  }

  static showPopupError(
    BuildContext context,
    String title,
    String description,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkText: "Ok",
      btnCancel: null,
      btnOkOnPress: () {},
    ).show();
  }
}
