import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/config/constants/colors.dart';

TextTheme buildTextTheme() {
  return TextTheme(
    headline1: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: CustomColors.blueTheme,
    ),
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: CustomColors.blueTheme,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      color: CustomColors.darkGrey,
    ),
  );
}
