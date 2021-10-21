import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hex_color.dart';
import 'theme.dart';

class Config {
  static final Config _config = Config._internal();

  factory Config() {
    return _config;
  }

  static String firebaseApiKey = "";
  static String version = "";
  static Color pink = HexColor("#FF3399");
  static Color electricBlue = HexColor("#0033FF");
  static Color lightBlue = HexColor("#00CCFF");
  static int mode = 2;
  static String deviceId;
  static bool showOnboarding;

  Config._internal();

  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  final List<String> supportedLanguages = [
    "English",
    "Japanisch",
    "Deutsch",
  ];

  final List<String> supportedLanguagesCodes = ["en", "ja", "de"];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  static saveMode(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      await prefs.setInt('mode', value);
    }
  }

  static Future<AppTheme> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var index = (prefs.getInt('theme') ?? 0);
    return myThemes[index];
  }

  static AppTheme getDefaultTheme() {
    return myThemes[0];
  }
}

Config config = Config();
