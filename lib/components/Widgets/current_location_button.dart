import 'package:flutter/material.dart';

Widget buildCurrentLocationIcon() {
  return const Align(
    child: Padding(
      padding: EdgeInsets.only(bottom: 30, right: 8),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.my_location,
          color: Colors.white,
        ),
      ),
    ),
  );
}
