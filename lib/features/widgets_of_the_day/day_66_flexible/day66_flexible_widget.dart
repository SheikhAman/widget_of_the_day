import 'package:flutter/material.dart';

class Day66FlexibleWidget extends StatelessWidget {
  const Day66FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 66 - Flexible'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.indigo,
              child: const Center(
                child: Text(
                  'Header Section',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Content Section',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Footer Section',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}