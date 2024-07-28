import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pickUpPointController = TextEditingController();
    TextEditingController dropPointController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Your Location To',
              hintText: 'Location fetched',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'DROP',
              hintText: 'Where are you going?',
            ),
          ),
        ],
      ),
    );
  }
}
