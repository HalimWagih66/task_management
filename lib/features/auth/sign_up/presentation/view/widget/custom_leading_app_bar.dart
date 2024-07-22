import 'package:flutter/material.dart';

class CustomLeadingAppBar extends StatelessWidget {
  const CustomLeadingAppBar({super.key, this.onTap, required this.iconData});
  final void Function()? onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap!();
      }, icon: Icon(iconData) ,
    );
  }
}
