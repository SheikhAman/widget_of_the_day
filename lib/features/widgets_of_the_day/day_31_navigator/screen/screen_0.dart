import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 0'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen1'),
              child: const Text('Go to Screen 1'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen2'),
              child: const Text('Go to Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}