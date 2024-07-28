import 'package:flutter/material.dart';
import '../components/Map/google_map.dart';
import '../components/Widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(child: MapView()),
          const TripTypeSelector(),
          const LocationInput(),
        ],
      ),
    );
  }
}
