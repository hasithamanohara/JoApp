import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:joapp/app/app.dart';
import 'package:provider/provider.dart';
import 'services/auth/auth_provider.dart';
import 'services/connectivty/connectivty_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
  ], child: const JoApp()));
}
