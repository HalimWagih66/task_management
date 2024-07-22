
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageWithSnackPar({required String message,required BuildContext context}){
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
       backgroundColor: const Color(0xff3598db),
       content: Text(message),
     ),
   );
}