import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/api_calling/get_place.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  Position? cabPosition;
  Position? dropPosition;
  String _errorMessage = '';

  Position? get currentPosition => _currentPosition;
  String get errorMessage => _errorMessage;
  double? get latitude => _currentPosition?.latitude;
  double? get longitude => _currentPosition?.longitude;

  Future<bool> _handlePermission() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isRestricted) {
      status = await Permission.location.request();
    }

    if (status.isDenied) {
      _errorMessage = 'Location permissions are denied';
      notifyListeners();
      return false;
    }

    if (status.isPermanentlyDenied) {
      _errorMessage =
          'Location permissions are permanently denied. Please enable them in settings.';
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<void> getCurrentLocation() async {
    notifyListeners();
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return;
    }

    try {
      _currentPosition = await Geolocator.getCurrentPosition();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Error getting location: $e';
    }

    notifyListeners();
  }

  Future<void> getDropingLocation(String placeName) async {
    notifyListeners();
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return;
    }

    try {
      final location =
          await LocationService().fetchLocationCoordinates(placeName);
      if (location != null) {
        _currentPosition = Position(
          latitude: location.latitude,
          longitude: location.longitude,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        );
        _errorMessage = '';
      } else {
        _errorMessage = 'Location not found';
      }
    } catch (e) {
      _errorMessage = 'Error getting location: $e';
    }

    notifyListeners();
  }
}
