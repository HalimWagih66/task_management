import 'package:flutter/material.dart';

import '../../../style/colors/application_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {

    },style: ElevatedButton.styleFrom(backgroundColor: primaryColor), child: Text("Login",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),);
  }
}