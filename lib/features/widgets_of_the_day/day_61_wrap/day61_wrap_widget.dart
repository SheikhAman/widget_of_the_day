import 'package:flutter/material.dart';

class Day61WrapWidget extends StatelessWidget {
  const Day61WrapWidget({super.key});

  Widget buildImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://images.unsplash.com/photo-1517849845537-4d257902454a?w=300',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> get imageList => List.generate(10, (_) => buildImage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 61- Wrap')),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: imageList,
        ),
      ),
    );
  }
}