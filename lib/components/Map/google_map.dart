import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/internet_connecton_hadler.dart';
import '../../utils/location_handle.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? mapController;
  LatLng _center = const LatLng(6.3928, 81.3455); // Default location
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    bool hasInternet = await InternetConnectionChecker.hasConnection();
    if (!hasInternet) {
      _showErrorDialog("No internet connection");
      return;
    }

    bool hasPermission = await LocationService.handleLocationPermission();
    if (!hasPermission) {
      _showErrorDialog("Location permission denied");
      return;
    }

    Position? position = await LocationService.getCurrentLocation();
    if (position != null) {
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } else {
      _showErrorDialog("Unable to get current location");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
