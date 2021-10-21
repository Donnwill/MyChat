import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_chat/helper/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoutes {
  static const String home = "home";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    SharedPreferences prefs;

    return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) {
          switch (routeSettings.name) {
            case home:
              return HomePage();

            default:
              return HomePage();
          }
        });
  }
}
