import 'package:flutter/material.dart';

class Day36TransformWidget extends StatelessWidget {
  const Day36TransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 36 - Transform'),
      ),
      body: Center(
        child: Transform.rotate(
          angle: 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=800&q=80',
              width: 300,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}