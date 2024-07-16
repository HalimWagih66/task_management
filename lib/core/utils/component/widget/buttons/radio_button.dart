import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key, required this.value, required this.groupValue, required this.onTap, required this.text});
  final int value;
  final int groupValue;
  final Function onTap;
  final String text;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: (value) {
              widget.onTap(value);
              setState(() {

              });
            }),
        Text(widget.text),
        const SizedBox(width: 6),
      ],
    );
  }
}
