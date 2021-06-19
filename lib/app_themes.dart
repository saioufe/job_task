import 'package:flutter/material.dart';

enum AppTheme { White, Dark }

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.White: ThemeData(
    fontFamily: 'cairo',
    canvasColor: Color.fromRGBO(244, 244, 244, 1),
    primaryColor: Colors.blue,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
  AppTheme.Dark: ThemeData(
    fontFamily: 'cairo',
    canvasColor: Colors.black12,
    primaryColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(color: Colors.grey.shade600),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      textTheme: TextTheme(
        title: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
};
