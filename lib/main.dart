import 'package:flutter/material.dart';
import 'package:joapp/app/app.dart';
import 'package:provider/provider.dart';

import 'services/auth/auth_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
  ], child: const JoApp()));
}
