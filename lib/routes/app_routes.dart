import 'package:flutter/material.dart';
import '../views/auth_screnn.dart';
import '../views/home_screen.dart';
import '../views/splash_Screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        auth: (context) => const AuthScreen(),
        home: (context) => const HomeScreen(),
      };
}
