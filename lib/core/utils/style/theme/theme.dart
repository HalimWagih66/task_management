import 'package:flutter/material.dart';

import '../colors/application_color.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: primaryColor,
      scaffoldBackgroundColor: const Color(0xffF2F5FF),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 22,
            fontWeight: FontWeight.bold
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: "Poppins",
            color: primaryColor
        ),
        titleMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        displayMedium: TextStyle(
            fontSize: 19,
            fontFamily: "STC",
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
        displayLarge: TextStyle(
            fontSize: 30,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w800,
            color: Colors.white
        ),
        labelSmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey
        ),
        // bodySmall: TextStyle(
        //     fontSize: 18,
        //     color: Color(0xbb8d8d8d),
        //     fontWeight: FontWeight.w600
        // ),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff1F1F1F),
            letterSpacing: 1.2,
            fontFamily: "Manrope"
        ),
        displaySmall: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.normal,
            letterSpacing: 0.32,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: Color(0xff606060)
        ),
      )
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: primaryColor,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 22,
            fontWeight: FontWeight.bold
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: "Poppins",
            color: primaryColor
        ),
        titleMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
        displayMedium: TextStyle(
            fontSize: 19,
            fontFamily: "STC",
            fontWeight: FontWeight.bold,
            color: Color(0xff060E1E),
        ),
        displayLarge: TextStyle(
            fontSize: 30,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w800,
            color: Color(0xff060E1E),
        ),
        labelSmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xffc9c9c9)
        ),
        // bodySmall: TextStyle(
        //     fontSize: 18,
        //     color: Color(0xbb8d8d8d),
        //     fontWeight: FontWeight.w600
        // ),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.2,
            fontFamily: "Manrope"
        ),
        displaySmall: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.normal,
            letterSpacing: 0.32,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: Color(0xffc9c9c9)
        ),
      )
  );
}