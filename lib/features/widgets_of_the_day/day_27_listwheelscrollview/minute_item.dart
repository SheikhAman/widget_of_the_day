import 'package:flutter/material.dart';

class MinuteItem extends StatelessWidget {
  final int minute;
  const MinuteItem({super.key, required this.minute});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        minute.toString().padLeft(2, '0'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}