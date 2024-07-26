import 'package:flutter/material.dart';

class TripTypeSelector extends StatefulWidget {
  const TripTypeSelector({super.key});

  @override
  State<TripTypeSelector> createState() => _TripTypeSelectorState();
}

class _TripTypeSelectorState extends State<TripTypeSelector> {
  bool isOneWay = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => setState(() => isOneWay = true),
              style: ElevatedButton.styleFrom(
                backgroundColor: isOneWay ? Colors.blue : Colors.grey,
              ),
              child: const Text('One way'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () => setState(() => isOneWay = false),
              style: ElevatedButton.styleFrom(
                backgroundColor: !isOneWay ? Colors.blue : Colors.grey,
              ),
              child: const Text('Return trip'),
            ),
          ),
        ],
      ),
    );
  }
}
