import 'package:flutter/material.dart';

Widget buildNotificationIcon() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30, left: 8),
    child: CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.notifications,
        color: Color(0xffC3CDD6),
      ),
    ),
  );
}
