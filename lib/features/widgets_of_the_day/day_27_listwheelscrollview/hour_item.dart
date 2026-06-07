import 'package:flutter/material.dart';

class HourItem extends StatelessWidget {
  final int hour;
  const HourItem({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        hour.toString().padLeft(2, '0'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}