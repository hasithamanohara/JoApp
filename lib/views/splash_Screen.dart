import 'package:flutter/material.dart';
import 'package:joapp/controllers/splash_screen_controller.dart';
import '../themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController ctrl = SplashScreenController();

  @override
  void initState() {
    super.initState();
    ctrl.checkAuthStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background, AppColors.secondary],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text('At your servers',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
              const Spacer(),
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'we are here to make your trip memorable.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
