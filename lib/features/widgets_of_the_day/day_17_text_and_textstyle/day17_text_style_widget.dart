import 'package:flutter/material.dart';

class Day17TextStyleWidget extends StatelessWidget {
  const Day17TextStyleWidget({super.key});

  // reusable styles (best practice)
  static const TextStyle pinkStyle = TextStyle(
    fontSize: 16,
    color: Colors.pink,
  );

  static const TextStyle greenStyle = TextStyle(
    fontSize: 30,
    color: Colors.green,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 17 - Text & Style"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Text(
              "Text Widget Tutorial",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "How to customize and style text in Flutter 🚀",
              style: pinkStyle,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            Text(
              "Another styled text example",
              style: greenStyle,
            ),
          ],
        ),
      ),
    );
  }
}