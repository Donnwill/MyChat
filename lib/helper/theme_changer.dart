import 'theme.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  AppTheme _appTheme;

  ThemeChanger(this._appTheme);

  getTheme() => buildThemeData(_appTheme);

  setTheme(AppTheme theme) {
    _appTheme = theme;
    notifyListeners();
  }

  AppTheme getAppTheme() {
    return _appTheme;
  }
}
