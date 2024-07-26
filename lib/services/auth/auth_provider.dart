import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = true;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = false;
    notifyListeners();
  }
}
