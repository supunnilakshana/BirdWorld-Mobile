import 'dart:ui';

import 'package:flutter/material.dart';

enum DialogType { Info, Error, Success }

extension DialogTypeExtension on DialogType {
  IconData? get icon {
    switch (this) {
      case DialogType.Error:
        return Icons.error_outline_rounded;

      case DialogType.Success:
        return Icons.verified_outlined;

      case DialogType.Info:
      default:
        return Icons.info_outline_rounded;
    }
  }

  // Color get color {
  //   switch (this) {
  //     case DialogType.Error:
  //       return AppColors.error;
  //
  //     case DialogType.Success:
  //       return AppColors.success;
  //
  //     case DialogType.Info:
  //     default:
  //       return AppColors.info;
  //   }
  // }
}

class DialogMessage<T> extends StatefulWidget {
  final String? title;
  final String message;
  final String positiveText;
  final Function(T)? positiveCallback;
  final String? negativeText;
  final Function(T)? negativeCallback;
  final T? extra;
  final DialogType type;
  final bool autoDismiss;

  const DialogMessage(
      {Key? key,
      this.title,
      required this.message,
      this.positiveText = 'OK',
      this.positiveCallback,
      this.negativeText,
      this.negativeCallback,
      this.extra,
      this.type = DialogType.Info,
      this.autoDismiss = false})
      : super(key: key);

  @override
  _DialogMessageState createState() => _DialogMessageState();
}

class _DialogMessageState extends State<DialogMessage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 336,
        height: 280,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFF161615),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: _bodyContent(),
      ),
    );
  }

  _bodyContent() {
    return Column(
      mainAxisSize: MainAxisSize.min, // To make the card compact
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _title(),
        _message(),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildNegativeButton(),
            const SizedBox(width: 8.0),
            buildPositiveButton(),
          ],
        ),
      ],
    );
  }

  Widget _title() {
    if (widget.title == null) {
      return Container();
    } else {
      return Column(
        children: <Widget>[
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                // color: widget.negativeText != null &&
                //         widget.type == DialogType.Info
                //     ? AppColors.error(context)
                //     : widget.type.color
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      );
    }
  }

  Widget _message() {
    return Text(
      widget.message,
      style: Theme.of(context).textTheme.subtitle2,
      textAlign: TextAlign.center,
    );
  }

  Widget buildPositiveButton() {
    return TextButton(
      child: Text(
        widget.positiveText,
      ),
      onPressed: () {
        if (widget.positiveCallback == null) {
          Navigator.pop(context, widget.extra);
        } else {
          if (widget.autoDismiss) Navigator.pop(context, widget.extra);
          widget.positiveCallback!(widget.extra);
        }
      },
    );
  }

  Widget buildNegativeButton() {
    if (widget.negativeText == null) return Container();

    return TextButton(
      child: Text(
        widget.negativeText ?? 'CANCEL',
      ),
      onPressed: () {
        if (widget.negativeCallback == null) {
          Navigator.pop(context, widget.extra);
        } else {
          widget.negativeCallback!(widget.extra);
        }
      },
    );
  }
}
