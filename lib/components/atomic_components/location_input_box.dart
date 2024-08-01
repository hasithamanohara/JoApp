import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pickUpPointController = TextEditingController();
    TextEditingController dropPointController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: pickUpPointController,
              decoration: InputDecoration(
                hintText: 'Location fetched',
                hintStyle: const TextStyle(fontSize: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.location_on, size: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: dropPointController,
              decoration: InputDecoration(
                hintText: 'Where are you going?',
                hintStyle: const TextStyle(fontSize: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.location_city,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
