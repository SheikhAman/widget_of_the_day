import 'package:flutter/material.dart';

class Day41ClipRRectWidget extends StatelessWidget {
  const Day41ClipRRectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 41 - ClipRRect'),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(70),
            topLeft: Radius.circular(170),
            bottomRight: Radius.circular(270),
            bottomLeft: Radius.circular(270),
          ),
          child: Image.network(
            'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=800',
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}