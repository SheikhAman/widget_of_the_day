import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/screen2'),
          child: const Text('Go to Screen 2'),
        ),
      ),
    );
  }
}