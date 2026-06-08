import 'package:flutter/material.dart';

class Day37PositionedWidget extends StatelessWidget {
  const Day37PositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 37 - Positioned'),
      ),
      body: Center(
        child: SizedBox(
          height: 450,
          width: 300,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'What was I thinking?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                width: 220,
                height: 320,
                child: Image.network(
                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=800&q=80',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}