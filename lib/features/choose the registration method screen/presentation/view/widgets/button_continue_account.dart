import 'package:flutter/material.dart';

class ButtonContinueAccount extends StatelessWidget {
  const ButtonContinueAccount(
      {super.key, required this.text, required this.onPressed, this.icon, required this.background, required this.onLongPress});
  final Color background;
  final String text;
  final IconData? icon;
  final Future<void> Function() onPressed;
  final Future<void> Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onLongPress: () async{
        await onLongPress!();
      },
      onPressed: () async{
        await onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child:ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
        title:Padding(
          padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.13),
          child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white,)),
        )

      )
    );
  }
}
