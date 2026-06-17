import 'package:flutter/material.dart';

class Day79SafeAreaWidget extends StatelessWidget {
  const Day79SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Day 79 - SafeArea'),
        ),
        backgroundColor: const Color(0xFF0F172A),
        body: Center(
          child: Text(
            'I am safe from notches! 🛡',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6366F1),
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: Color(0xFF6366F1).withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}