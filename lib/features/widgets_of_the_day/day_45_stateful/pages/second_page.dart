import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int numberSecond;

  const SecondPage({
    super.key,
    required this.numberSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numberSecond.toString(),
              style: const TextStyle(fontSize: 60),
            ),

            const SizedBox(height: 10),

            const Text('Second Page Screen'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}