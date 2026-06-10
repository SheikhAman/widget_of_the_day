import 'package:flutter/material.dart';

class Day40ClipOvalWidget extends StatelessWidget {
  const Day40ClipOvalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 40 - ClipOval'),
      ),
      body: Center(
        child: ClipOval(
          child: Image.network(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=800&q=80',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}