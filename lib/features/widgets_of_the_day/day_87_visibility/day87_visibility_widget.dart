import 'package:flutter/material.dart';

class Day87VisibilityWidget extends StatefulWidget {
  const Day87VisibilityWidget({super.key});

  @override
  State<Day87VisibilityWidget> createState() => _Day87VisibilityWidgetState();
}

class _Day87VisibilityWidgetState extends State<Day87VisibilityWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 87 - Visibility'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              child: Text(
                isVisible ? 'Hide Image' : 'Show Image',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: isVisible,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=1200',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}