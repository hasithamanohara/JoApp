import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            // Implement login logic
            // After successful login:
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          },
        ),
      ),
    );
  }
}
