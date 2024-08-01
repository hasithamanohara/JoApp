import 'package:flutter/material.dart';
import '../components/Map/google_map.dart';
import '../components/Widgets/current_location_button.dart';
import '../components/Widgets/notification_widget.dart';
import '../components/Widgets/profile_tile.dart';
import '../components/atomic_components/location_input_box.dart';
import '../components/atomic_components/trip_type_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: MapView()),
          const Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: ProfileTile(),
          ),
          Positioned(right: 16, bottom: 180, child: buildCurrentLocationIcon()),
          Positioned(left: 16, bottom: 180, child: buildNotificationIcon()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TripTypeSelector(),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
