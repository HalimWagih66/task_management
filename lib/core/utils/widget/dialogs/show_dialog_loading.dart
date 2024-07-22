import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
Future<void> showDialogLoading(BuildContext context, {required bool barrierDismissible})async {
  await showDialog(barrierDismissible: false,context: context, builder: (context) {
    return AlertDialog(
      content: FittedBox(
        fit:BoxFit.scaleDown,
        child: Center(
          child: LoadingAnimationWidget.hexagonDots(
            color: Colors.blue,
            size: 90,
          ),
        ),
      ),
    );
  }

  );
}
