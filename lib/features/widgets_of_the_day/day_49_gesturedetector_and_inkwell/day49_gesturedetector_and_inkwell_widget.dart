import 'dart:math';
import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_49_gesturedetector_and_inkwell/screens/screen1.dart';


class Day49GestureInkWellWidget extends StatefulWidget {
  const Day49GestureInkWellWidget({super.key});

  @override
  State<Day49GestureInkWellWidget> createState() =>
      _Day49GestureInkWellWidgetState();
}

class _Day49GestureInkWellWidgetState extends State<Day49GestureInkWellWidget> {
  int index = 0;
  final Random random = Random();

  final List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.cyan,
    Colors.yellow,
    Colors.red,
  ];

  void changeColor() {
    setState(() {
      index = random.nextInt(colors.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Day 49 - GestureDetector & InkWell'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ---------------- GestureDetector ----------------
            const Text(
              'GestureDetector',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Screen1(),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Text(
                  'Tap',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            const Divider(color: Colors.white24),

            const SizedBox(height: 50),

            // ---------------- InkWell ----------------
            const Text(
              'InkWell (Double Tap)',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(height: 10),

            InkWell(
              onDoubleTap: changeColor,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Text(
                  'Tap',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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