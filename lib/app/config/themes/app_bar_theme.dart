import 'package:flutter/material.dart';

AppBarTheme buildAppBarTheme() {
  const FONT_SIZE = 16.0;
  const ELEVATION = 0.0;
  const ICON_SIZE = 20.0;

  return AppBarTheme(
    elevation: ELEVATION,
    centerTitle: true,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: FONT_SIZE,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: ICON_SIZE,
    ),
  );
}
