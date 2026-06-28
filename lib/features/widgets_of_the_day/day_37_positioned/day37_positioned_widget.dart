import 'package:flutter/material.dart';

// ✅ WHAT THIS TEACHES:
//    Stack  → lets widgets overlap (like layers)
//    Positioned → places a widget at an exact spot inside a Stack

class Day37PositionedWidget extends StatelessWidget {
  const Day37PositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Day 37 – Stack & Positioned'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 👇 CONCEPT LABEL — helps beginners understand what they see
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade200),
              ),
              child: const Text(
                '🗂  Stack = widgets that overlap like layers',
                style: TextStyle(fontSize: 14, color: Colors.deepPurple),
              ),
            ),

            // 👇 THE STACK — this is the main demo
            SizedBox(
              height: 400,
              width: 300,
              child: Stack(
                children: [

                  // LAYER 1 — purple card (sits in the center of the Stack)
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'What was\nI thinking?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // LAYER 2 — photo (pinned to bottom-left using Positioned)
                  // Positioned lets us say: "bottom: 0, left: 0" = bottom-left corner
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: 200,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e'
                            '?auto=format&fit=crop&w=800&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}