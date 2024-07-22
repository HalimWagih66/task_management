import 'package:flutter/material.dart';

import '../../../../../../core/style/colors/application_color.dart';


class CustomIconNavigateBetweenPages extends StatelessWidget {
   const CustomIconNavigateBetweenPages(
      {super.key,required this.onPressed, required this.iconData, this.isNext = true});
  final Function onPressed;
  final bool isNext;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        highlightColor: Colors.transparent,
        onPressed: () {
          onPressed();
        },
        icon: Directionality(
          textDirection: isNext?TextDirection.ltr:TextDirection.rtl,
          child: Icon(
            iconData,
            color: primaryColor,
            size: 80,
          ),
        ),
      ),
    );
  }
}
