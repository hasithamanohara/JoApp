import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  String _errorMessage = '';
  bool _isLoading = false;

  Position? get currentPosition => _currentPosition;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _errorMessage =
          'Location services are disabled. Please enable the services';
      notifyListeners();
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _errorMessage = 'Location permissions are denied';
        notifyListeners();
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _errorMessage =
          'Location permissions are permanently denied, we cannot request permissions.';
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<void> getCurrentLocation() async {
    _isLoading = true;
    notifyListeners();

    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      _currentPosition = await Geolocator.getCurrentPosition();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Error getting location: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
