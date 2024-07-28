import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  Future<LatLng?> fetchLocationCoordinates(String placeName) async {
    final apiKey = dotenv.env['GOOGLE_PLACES_API_KEY'];
    final url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$placeName&inputtype=textquery&fields=geometry&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          final location = data['candidates'][0]['geometry']['location'];
          final latitude = location['lat'];
          final longitude = location['lng'];

          return LatLng(latitude, longitude);
        }
      } else {
        throw Exception('Error retrieving location: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching location: $e');
      throw e;
    }
    return null;
  }
}

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}
