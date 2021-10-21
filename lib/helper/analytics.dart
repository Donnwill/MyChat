import 'routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppAnalyticsEvents {
  static const String logOut = "log_out";
}

class AnalyticsScreenNames {
  static const String onboarding = "Onboarding";
  static const String settings = "Settings";
  static const String login = "Login";
  static const String userInfo = "Profile";
  static const String home = "Home";
  static const String faq = "FAQ";
}

FirebaseAnalytics _getAnalytics(BuildContext context) => Provider.of<FirebaseAnalytics>(context, listen: false);

Future<void> logEvent(BuildContext context, String name, {Map<String, dynamic> params}) {
  return _getAnalytics(context).logEvent(name: name, parameters: params);
}

Future<void> setCurrentScreen(BuildContext context, String name) {
  return _getAnalytics(context).setCurrentScreen(screenName: name);
}

Future<void> setUserProperties(BuildContext context, {String id, String name, String email}) async {
  await _getAnalytics(context).setUserId(id);
  await _getAnalytics(context).setUserProperty(name: "email", value: email);
  await _getAnalytics(context).setUserProperty(name: "name", value: name);
  return;
}

String analyticsNameExtractor(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
    default:
      return AnalyticsScreenNames.home;
  }
}
