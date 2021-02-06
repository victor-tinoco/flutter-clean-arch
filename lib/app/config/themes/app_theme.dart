import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/config/themes/app_bar_theme.dart';
import 'package:squadmobile_base_project/app/config/themes/text_theme.dart';
import 'package:squadmobile_base_project/app/config/constants/colors.dart';
import 'package:squadmobile_base_project/app/config/constants/fonts.dart';

ThemeData buildTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColors.blueTheme,
    accentColor: CustomColors.darkGrey,
    fontFamily: Fonts.ROBOTO,
    appBarTheme: buildAppBarTheme(),
    textTheme: buildTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: CustomColors.blueTheme,
    ),
  );
}
