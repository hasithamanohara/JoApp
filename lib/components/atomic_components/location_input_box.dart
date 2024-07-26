import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'PICKUP',
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
