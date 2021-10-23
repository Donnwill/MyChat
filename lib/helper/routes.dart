import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_chat/pages/home_page.dart';
import 'package:my_chat/pages/loginAndRegister/login_register_page.dart';

class AppRoutes {
  static const String login = "login";
  static const String home = "home";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) {
          switch (routeSettings.name) {
            case home:
              return HomePage();
            case login:
              return LoginRegisterPage();

            default:
              return LoginRegisterPage();
          }
        });
  }
}
