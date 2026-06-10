import 'package:flutter/material.dart';

class Day42ClipRectWidget extends StatelessWidget {
  const Day42ClipRectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 42 - ClipRect'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Before ClipRect',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 10),

            // BEFORE (no clipping effect visible)
            Image.network(
              'https://i.pravatar.cc/300',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 30),

            const Text(
              'After ClipRect',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // AFTER (ClipRect effect)
            ClipRect(
              child: Align(
                heightFactor: 0.8,
                widthFactor: 0.8,
                child: Image.network(
                  'https://i.pravatar.cc/300',
                  height: 200,
                  width: 200,
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