import 'package:flutter/material.dart';

class Day78AlignWidget extends StatelessWidget {
  const Day78AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 78 - Align'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'UI Positioning with Align',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // TOP RIGHT
            buildAlignBox(
              title: "Top Right",
              alignment: Alignment.topRight,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            // CENTER
            buildAlignBox(
              title: "Center",
              alignment: Alignment.center,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            // BOTTOM LEFT
            buildAlignBox(
              title: "Bottom Left",
              alignment: Alignment.bottomLeft,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAlignBox({
    required String title,
    required Alignment alignment,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.black12,
          child: Align(
            alignment: alignment,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Hello UI",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}