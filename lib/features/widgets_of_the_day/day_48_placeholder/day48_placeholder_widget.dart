import 'package:flutter/material.dart';

class Day48PlaceholderWidget extends StatelessWidget {
  const Day48PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 48 - Placeholder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: const [
            SizedBox(height: 10),

            // Top banner placeholder
            Placeholder(
              fallbackHeight: 120,
              strokeWidth: 2,
              color: Colors.teal,
            ),

            SizedBox(height: 20),

            // Middle layout (like dashboard skeleton)
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Placeholder(
                      strokeWidth: 2,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Placeholder(
                      strokeWidth: 2,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Bottom section placeholder
            Placeholder(
              fallbackHeight: 80,
              strokeWidth: 2,
              color: Colors.red,
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}