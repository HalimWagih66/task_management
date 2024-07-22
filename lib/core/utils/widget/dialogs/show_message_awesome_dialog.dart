import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showMessageWithAwesomeDialog({
    required BuildContext context,
    required String message,
    required DialogType dialogType,
    String? title,
    String? posActionName,
    Function? posAction,
  bool dismissOnTouchOutside = false,
    String? nigActionName,
    Function? nigAction,
  }) {
    AwesomeDialog(
      dismissOnTouchOutside: dismissOnTouchOutside,
      dialogBackgroundColor: const Color(0xffffffff),
      context: context,
      dialogType: dialogType,
      title: title,
      titleTextStyle: Theme.of(context).textTheme.displaySmall,
      animType: AnimType.rightSlide,
      desc: message,
      descTextStyle: Theme.of(context).textTheme.titleLarge,
      btnCancelOnPress: nigActionName != null
          ? () {
        nigAction!.call();
      }
          : null,
      btnOkOnPress: posActionName != null
          ? () {
        posAction!();
      }
          : null,
      btnOkText: posActionName,
      btnCancelText: nigActionName,
    ).show();
}
