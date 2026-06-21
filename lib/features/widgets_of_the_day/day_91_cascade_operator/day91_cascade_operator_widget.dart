import 'package:flutter/material.dart';
import 'user_model.dart';

class Day91CascadeOperatorWidget extends StatelessWidget {
  const Day91CascadeOperatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // =========================
    // USING CASCADE OPERATOR
    // =========================
    final user1 = User()
      ..name = 'User1'
      ..age = 13
      ..changeName(); // modifies name inside model

    // =========================
    // WITHOUT CASCADE OPERATOR
    // =========================
    final user2 = User();
    user2.name = 'User2';
    user2.age = 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 91 - Cascade Operator (..)",),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HEADER EXPLANATION
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "CASCADE OPERATOR (..)\n\n"
                    "👉 Used to perform multiple operations on one object\n"
                    "👉 Makes code shorter & cleaner\n"
                    "👉 Avoids repeating object name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // CASCADE RESULT
            // =========================
            const Text(
              "1️⃣ Using Cascade Operator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Name: ${user1.name}"),
            Text("Age: ${user1.age}"),

            const SizedBox(height: 20),

            // =========================
            // NORMAL WAY RESULT
            // =========================
            const Text(
              "2️⃣ Without Cascade Operator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Name: ${user2.name}"),
            Text("Age: ${user2.age}"),

            const SizedBox(height: 20),

            // =========================
            // NOTE
            // =========================
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "💡 Tip:\n"
                    "Cascade operator helps reduce boilerplate code and is widely used in clean Dart codebases.",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}