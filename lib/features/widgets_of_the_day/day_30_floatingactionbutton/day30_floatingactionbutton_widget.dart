import 'package:flutter/material.dart';

class Day30FloatingActionButtonWidget extends StatelessWidget {
  const Day30FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 30 - FloatingActionButton'),
      ),

      body: const Center(
        child: Text(
          "Floating Action Button Demo",
          style: TextStyle(fontSize: 18),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
