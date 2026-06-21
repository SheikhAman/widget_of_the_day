import 'package:flutter/material.dart';

class Day93FractionallySizedBox extends StatelessWidget {
  const Day93FractionallySizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 93 - FractionallySizedBox"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.6, // 60% of parent width
            heightFactor: 0.7, // 70% of parent height
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "60% x 70%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}