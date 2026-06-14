import 'package:flutter/material.dart';

class Day56FittedBoxWidget extends StatelessWidget {
  const Day56FittedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 56 - FittedBox'),
      ),
      body: Center(
        child: Container(
          width: 280,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'FLUTTER DASHBOARD CARD',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}