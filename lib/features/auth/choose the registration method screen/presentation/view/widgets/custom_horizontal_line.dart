import 'package:flutter/material.dart';

class CustomHorizontalLine extends StatelessWidget {
  const CustomHorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        children: [
          const Expanded(
            child: SizedBox(
              height: 10,
              child: Divider(
                thickness: 2,
                height: 2,
                endIndent: 5,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 10),child: Text("OR",style: Theme.of(context).textTheme.bodyLarge,)),
          const Expanded(
            child: SizedBox(
              height: 10,
              child: Divider(
                thickness: 2,
                height: 2,
                indent:5,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
