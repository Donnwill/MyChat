import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/theme.dart';
import 'helper/theme_changer.dart';
import 'helper/analytics.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var index = (prefs.getInt('theme') ?? 1);
  await Firebase.initializeApp();
  runApp(MyApp(
    thisTheme: myThemes[index],
  ));
}

class MyApp extends StatefulWidget {
  MyApp({this.thisTheme});
  final AppTheme thisTheme;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (context) => ThemeChanger(widget.thisTheme),
        ),
        Provider<FirebaseAnalytics>(
          create: (_) => FirebaseAnalytics(),
        ),
      ],
      child: Consumer<FirebaseAnalytics>(builder: (context, analytics, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: buildThemeData(theme.getAppTheme()),
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            FirebaseAnalyticsObserver(
              analytics: analytics,
              nameExtractor: analyticsNameExtractor,
            )
          ],
          home: HomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}


