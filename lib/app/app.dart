import 'package:flutter/material.dart';
import 'package:joapp/themes/app_theme.dart';
import '../routes/app_routes.dart';

class JoApp extends StatelessWidget {
  const JoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jo App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
