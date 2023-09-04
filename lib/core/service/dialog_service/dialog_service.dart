import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dialogs/dialog_message.dart';

class AppDialogServices {
  Future message(
    String? message, {
    String? title,
    DialogType type = DialogType.Info,
    String positiveButtonText = 'OK',
    Function(dynamic val)? positiveCallback,
    bool dismissible = true,
    bool autoDismiss = false,
  }) {
    return showDialog(
      context: StackedService.navigatorKey!.currentState!.context,
      barrierDismissible: dismissible,
      builder: (context) => DialogMessage(
        message: message!,
        title: title,
        type: type,
        positiveCallback: positiveCallback,
        positiveText: positiveButtonText,
        autoDismiss: autoDismiss,
      ),
    );
  }

  Future showWidget({
    required Widget widget,
    bool dismissible = true,
    bool autoDismiss = false,
  }) {
    return showCupertinoDialog(
        context: StackedService.navigatorKey!.currentState!.context,
        barrierDismissible: dismissible,
        builder: (context) => Dialog(
              alignment: Alignment.center,
              insetPadding: EdgeInsets.zero,
              backgroundColor: AppColors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: widget,
            ));
  }

  Future loading({
    bool dismissible = true,
    bool autoDismiss = false,
  }) {
    return showDialog(
        context: StackedService.navigatorKey!.currentState!.context,
        barrierDismissible: dismissible,
        builder: (context) => Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(
                      color: AppColors.appPrimary,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ));
  }

  Future confirm(
    String message, {
    String? title,
    String positiveButtonText = 'Yes',
    String negativeButtonText = 'No',
    Function(dynamic val)? positiveCallback,
    Function(dynamic val)? negativeCallBack,
    DialogType type = DialogType.Info,
    bool dismissible = true,
    bool autoDismiss = false,
  }) {
    return showDialog(
      useSafeArea: true,
      context: StackedService.navigatorKey!.currentState!.context,
      barrierDismissible: dismissible,
      builder: (context) => DialogMessage(
        message: message,
        title: title,
        positiveText: positiveButtonText,
        negativeText: negativeButtonText,
        positiveCallback: positiveCallback,
        negativeCallback: negativeCallBack,
        type: type,
        autoDismiss: autoDismiss,
      ),
    );
  }

  ScaffoldFeatureController showSnackBar(
    String message, {
    Color? backgroundColor,
    TextStyle? style,
    TextAlign? textAlign,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    return ScaffoldMessenger.of(
            StackedService.navigatorKey!.currentState!.context)
        .showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: style,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow,
          maxLines: maxLines,
        ),
        duration: duration,
      ),
    );
  }
}
