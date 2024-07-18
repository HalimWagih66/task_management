import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/colors/application_color.dart';

class CustomAnimatedButton extends StatelessWidget {
  const CustomAnimatedButton({
    super.key, required this.pressEven, required this.textButton,
  });
  final void Function() pressEven;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        pressEvent: () {
          pressEven();
        },
        text: textButton,
        color: primaryColor,
        buttonTextStyle: Theme.of(context).textTheme.titleLarge
    );
  }
}
