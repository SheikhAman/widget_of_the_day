import 'package:flutter/material.dart';

class Day72AnimatedPaddingWidget extends StatefulWidget {
  const Day72AnimatedPaddingWidget({super.key});

  @override
  State<Day72AnimatedPaddingWidget> createState() =>
      _Day72AnimatedPaddingWidgetState();
}

class _Day72AnimatedPaddingWidgetState
    extends State<Day72AnimatedPaddingWidget> {
  double paddingValue = 0;

  void increasePadding() {
    setState(() {
      paddingValue = 60;
    });
  }

  void resetPadding() {
    setState(() {
      paddingValue = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Day 72 - AnimatedPadding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedPadding(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(paddingValue),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://images.unsplash.com/photo-1546182990-dffeafbe841d?auto=format&fit=crop&w=1200&q=80',
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: increasePadding,
                  icon: const Icon(Icons.zoom_out),
                  label: const Text('Increase Padding'),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: resetPadding,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'AnimatedPadding smoothly animates spacing changes around widgets.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}