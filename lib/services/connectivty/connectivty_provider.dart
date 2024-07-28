import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../utils/internet_connecton_hadler.dart';

class ConnectivityProvider with ChangeNotifier {
  bool _isOnline = false;
  bool get isOnline => _isOnline;

  ConnectivityProvider() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _isOnline = (results.first != ConnectivityResult.none);
      notifyListeners();
    });
  }

  Future<void> checkConnectivity() async {
    _isOnline = await ConnectivityUtils.isOnline();
    notifyListeners();
  }
}
