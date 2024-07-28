import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(6.3928, 81.3455), // Coordinates for Bogahawewa
        zoom: 15,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('pickup'),
          position: const LatLng(6.3928, 81.3455),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      },
      onMapCreated: (GoogleMapController controller) {
        // You can use the API key here if needed
        print('Map created with API key: ${dotenv.env['GOOGLE_MAPS_API_KEY']}');
      },
    );
  }
}
