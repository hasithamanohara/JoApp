import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:joapp/app/app.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/location_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => LocationProvider()),
  ], child: const JoApp()));
}
