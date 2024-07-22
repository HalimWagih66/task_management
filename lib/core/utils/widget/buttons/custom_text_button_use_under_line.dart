import 'package:flutter/material.dart';

import '../../../style/colors/application_color.dart';

class CustomTextButtonUseUnderLine extends StatelessWidget {
  const CustomTextButtonUseUnderLine({
    super.key, required this.onPressed, required this.text,
  });
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      onPressed();
    }, child: Text(text,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: primaryColor,decoration: TextDecoration.underline,decorationColor: primaryColor),));
  }
}
