import 'package:flutter/material.dart';

class Day68GridPaperWidget extends StatelessWidget {
  const Day68GridPaperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 68 - GridPaper')),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GridPaper(
          color: Colors.indigo.withValues(alpha: 0.35),
          interval: 60,
          divisions: 2,
          subdivisions: 3,
        ),
      ),
    );
  }
}
