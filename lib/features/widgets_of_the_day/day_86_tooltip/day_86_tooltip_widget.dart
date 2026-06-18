import 'package:flutter/material.dart';

class Day86TooltipWidget extends StatelessWidget {
  const Day86TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 86 - Tooltip'),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Tooltip(
                  message: 'High Quality',
                  waitDuration: Duration(milliseconds: 500),
                  child: Icon(
                    Icons.high_quality,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(width: 30),
                Tooltip(
                  message: 'Full Screen',
                  waitDuration: Duration(milliseconds: 500),
                  child: Icon(
                    Icons.fullscreen,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(width: 30),
                Tooltip(
                  message: 'Filter Content',
                  waitDuration: Duration(milliseconds: 500),
                  child: Icon(
                    Icons.filter_alt,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}