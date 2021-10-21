import 'package:flutter/material.dart';

import 'config.dart';
import 'hex_color.dart';

class MyTheme {
  Brightness brightness;
  Color backgroundColor;
  Color scaffoldBackgroundColor;
  Color primaryColor;
  Color cardColor;
  Color splashColor;
  Brightness primaryColorBrightness;
  Color accentColor;
  Color mainTextColor;
  Color mainBackgroundColor;
  Color highlightColor;
  Color primarySwatch;
  Color tabbarColor;
  String fontFamily;
  Color switchColor;
  Color unselectedWidgetColor;
  Color connectFeelbeltColor;

  MyTheme(
      {this.brightness,
      this.backgroundColor,
      this.scaffoldBackgroundColor,
      this.primaryColor,
      this.primaryColorBrightness,
      this.cardColor,
      this.splashColor,
      this.mainTextColor,
      this.fontFamily,
      this.primarySwatch,
      this.mainBackgroundColor,
      this.highlightColor,
      this.tabbarColor,
      this.accentColor,
      this.switchColor,
      this.unselectedWidgetColor,
      this.connectFeelbeltColor});
}

class AppTheme {
  String name;
  MyTheme theme;

  AppTheme(this.name, this.theme);
}

buildThemeData(AppTheme appTheme) {
  return ThemeData(
    brightness: appTheme.theme.brightness,
    backgroundColor: appTheme.theme.backgroundColor,
    scaffoldBackgroundColor: appTheme.theme.scaffoldBackgroundColor,
    primaryColor: appTheme.theme.primaryColor,
    primaryColorBrightness: appTheme.theme.primaryColorBrightness,
    accentColor: appTheme.theme.accentColor,
    splashColor: appTheme.theme.splashColor,
    highlightColor: appTheme.theme.highlightColor,
    fontFamily: appTheme.theme.fontFamily,
    cursorColor: Colors.pink,
    primarySwatch: appTheme.theme.primarySwatch,
    unselectedWidgetColor: appTheme.theme.unselectedWidgetColor,
  );
}

List<AppTheme> myThemes = [
  AppTheme(
      'Light',
      MyTheme(
          fontFamily: 'RocGrotesk',
          accentColor: Colors.pink,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Config.pink,
          mainBackgroundColor: Colors.white,
          primaryColorBrightness: Brightness.light,
          mainTextColor: Colors.black,
          tabbarColor: Colors.grey[800],
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          switchColor: Colors.green[600],
          unselectedWidgetColor: Colors.black54,
        connectFeelbeltColor: Colors.white,
      )),
  AppTheme(
    'Dark',
    MyTheme(
        brightness: Brightness.dark,
        fontFamily: 'RocGrotesk',
        accentColor: Colors.pink,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        primarySwatch: Colors.pink,
        mainBackgroundColor: HexColor("#151A22"),
        primaryColor: Config.pink,
        mainTextColor: Colors.white,
        tabbarColor: Colors.grey[500],
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        switchColor: Colors.green[400],
        unselectedWidgetColor: Colors.grey,
        connectFeelbeltColor: Colors.grey[800]),
  ),
];
