import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xFFB7935F);
  static Color blackColor = const Color(0xFF242424);
  static Color whiteColor = Colors.white;
  static Color yellowColor = const Color(0xFFFACC1D);
  static Color primaryDark = const Color(0xFF141A2E);
  static Color suraBackNavyBlue = const Color(0xFF181B37);

  static ThemeData lightMode = ThemeData(
    primaryColor: primaryColor,
    hintColor: blackColor,
    iconTheme: IconThemeData(color: blackColor),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        actionsIconTheme: IconThemeData(color: blackColor)),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: blackColor, fontWeight: FontWeight.bold, fontSize: 30),
        subtitle1: TextStyle(
            color: primaryColor, fontSize: 25, fontWeight: FontWeight.w600),
        subtitle2: TextStyle(
          color: blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        headline2: const TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(color: blackColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor, unselectedItemColor: whiteColor),
    scaffoldBackgroundColor: Colors.transparent,
  );
  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDark,
    hintColor: whiteColor,
    iconTheme: IconThemeData(color: whiteColor),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: whiteColor),
        actionsIconTheme: IconThemeData(color: whiteColor)),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: whiteColor, fontWeight: FontWeight.bold, fontSize: 30),
        subtitle1: TextStyle(
            color: yellowColor, fontSize: 25, fontWeight: FontWeight.w600),
        subtitle2: TextStyle(
          color: whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        headline2: const TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(color: yellowColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor, unselectedItemColor: whiteColor),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
