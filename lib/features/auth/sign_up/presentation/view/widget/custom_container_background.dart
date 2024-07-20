import 'package:flutter/material.dart';

class CustomContainerBackground extends StatelessWidget {
  const CustomContainerBackground({super.key, required this.child, this.height});
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18)
      ),
      child: child,
    );
  }
}
