import 'package:flutter/material.dart';

class Day69InteractiveViewerWidget extends StatelessWidget {
  const Day69InteractiveViewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 69 - InteractiveViewer'),
      ),

      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          scaleEnabled: true,
          minScale: 1,
          maxScale: 5,
          boundaryMargin: const EdgeInsets.all(20),
          child: Image.network(
            'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=80',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}