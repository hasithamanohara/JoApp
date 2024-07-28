import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      print('Failed to log in: $e');
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = false;
    notifyListeners();
  }
}
