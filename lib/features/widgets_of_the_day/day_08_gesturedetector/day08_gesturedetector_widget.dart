import 'package:flutter/material.dart';

class Day08GestureDetectorWidget extends StatefulWidget {
  const Day08GestureDetectorWidget({super.key});

  @override
  State<Day08GestureDetectorWidget> createState() =>
      _Day08GestureDetectorWidgetState();
}

class _Day08GestureDetectorWidgetState
    extends State<Day08GestureDetectorWidget> {
  int tapCount = 0;

  void _onTap() {
    setState(() {
      tapCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Day 08 - GestureDetector"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // COUNTER DISPLAY
            Text(
              "Tapped $tapCount times",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // BUTTON
            GestureDetector(
              onTap: _onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
                  "TAP HERE",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}