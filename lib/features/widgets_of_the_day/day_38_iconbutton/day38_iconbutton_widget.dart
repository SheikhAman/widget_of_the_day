import 'package:flutter/material.dart';

class Day38IconButtonWidget extends StatelessWidget {
  const Day38IconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 38 - IconButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                debugPrint('Icon button pressed');
              },
              icon: const Icon(
                Icons.email,
                color: Colors.indigo,
                size: 40,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Tap the email icon',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}