import 'package:flutter/material.dart';

class Day79SafeAreaWidget extends StatelessWidget {
  const Day79SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 79 - SafeArea'),

      ),
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Center(
          child: Text(
            'I am safe from notches! 🛡',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6366F1),
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}