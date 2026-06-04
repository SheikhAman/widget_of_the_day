import 'dart:async';
import 'package:flutter/material.dart';

class Day19TimerWidget extends StatefulWidget {
  const Day19TimerWidget({super.key});

  @override
  State<Day19TimerWidget> createState() => _Day19TimerWidgetState();
}

class _Day19TimerWidgetState extends State<Day19TimerWidget> {
  int timeLeft = 5;
  Timer? _timer;
  bool isRunning = false;

  void _startCountDown() {
    if (isRunning) return;

    isRunning = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    isRunning = false;
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      timeLeft = 5;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 19 - Timer"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              timeLeft == 0 ? "DONE" : "$timeLeft",
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _startCountDown,
              child: const Text("START"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: _resetTimer,
              child: const Text("RESET"),
            ),
          ],
        ),
      ),
    );
  }
}