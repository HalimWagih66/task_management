import 'package:flutter/material.dart';

class DisplayMessageIfImageNotFound extends StatelessWidget {
  const DisplayMessageIfImageNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text("Please Enter Your Image",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),),
      ),
    );
  }
}
