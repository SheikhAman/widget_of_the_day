import 'package:flutter/material.dart';

class Day101StreamBuilder extends StatelessWidget {
  const Day101StreamBuilder({super.key});

  // Fake Firebase-like Stream
  Stream<int> getCounterStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(
        Duration(seconds: i == 1 ? 2 : 1),
      );
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 101 - StreamBuilder"),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: getCounterStream(),
          initialData: 0,
          builder: (context, snapshot) {
            // Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // Error State
            if (snapshot.hasError) {
              return Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(fontSize: 18),
              );
            }

            // Data State
            return Text(
              "${snapshot.data}",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}