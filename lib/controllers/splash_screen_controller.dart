import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';
import '../services/auth/auth_provider.dart';

class SplashScreenController {
  Future<void> checkAuthStatus(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 100));
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.isAuthenticated) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.auth);
    }
  }
}
