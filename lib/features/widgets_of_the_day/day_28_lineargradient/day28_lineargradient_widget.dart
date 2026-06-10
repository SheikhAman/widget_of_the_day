import 'package:flutter/material.dart';

class Day28LinearGradientWidget  extends StatelessWidget {
  const Day28LinearGradientWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 28 - LinearGradient'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGradientCard(
              gradient: const LinearGradient(
                colors: [Colors.red, Colors.blue, Colors.green],
              ),
              title: "Simple Gradient",
            ),

            const SizedBox(height: 25),

            _buildGradientCard(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.4, 0.7, 1],
                colors: [
                  Colors.red,
                  Colors.purple,
                  Colors.yellow,
                  Colors.blue,
                ],
              ),
              title: "Advanced Gradient",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientCard({
    required LinearGradient gradient,
    required String title,
  }) {
    return Container(
      height: 160,
      width: 320,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}