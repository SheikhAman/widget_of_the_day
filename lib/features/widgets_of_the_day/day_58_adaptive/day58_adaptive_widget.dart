import 'package:flutter/material.dart';

class Day58AdaptiveWidget extends StatelessWidget {
  const Day58AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 58 - Adaptive Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Text(
              'Platform Adaptive UI Components',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Divider(),

            // iOS + Android adaptive slider
            Slider.adaptive(
              value: 0.5,
              onChanged: null,
            ),

            // Adaptive switch tile
            SwitchListTile.adaptive(
              title: Text('Enable Notifications'),
              value: true,
              onChanged: null,
            ),

            // Adaptive switch
            Switch.adaptive(
              value: true,
              onChanged: null,
            ),

            // Adaptive icon (platform aware)
            Icon(Icons.adaptive.share),

            // Adaptive loading indicator
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}