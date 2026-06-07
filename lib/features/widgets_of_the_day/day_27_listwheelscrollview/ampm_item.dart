import 'package:flutter/material.dart';

class AmPmItem extends StatelessWidget {
  final bool isAM;
  const AmPmItem({super.key, required this.isAM});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        isAM ? "AM" : "PM",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}