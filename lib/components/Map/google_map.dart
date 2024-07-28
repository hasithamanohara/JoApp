import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import '../../provider/location_provider.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? _mapController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    await locationProvider.getCurrentLocation();

    if (locationProvider.errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(locationProvider.errorMessage)),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        if (_isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final userLatitude = locationProvider.latitude;
        final userLongitude = locationProvider.longitude;

        if (userLatitude == null || userLongitude == null) {
          return const Center(child: Text('Location not available'));
        }

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(userLatitude, userLongitude),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('pickup'),
              position: LatLng(userLatitude, userLongitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
            ),
          },
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
            print(
                'Map created with API key: ${dotenv.env['GOOGLE_MAPS_API_KEY']}');
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
