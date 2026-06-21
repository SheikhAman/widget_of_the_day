import 'package:flutter/material.dart';

class Day94ConstrainedBox extends StatelessWidget {
  const Day94ConstrainedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 94 - ConstrainedBox"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// =========================
            /// MAX SIZE EXAMPLE
            /// =========================
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 200,
                maxWidth: 300,
                minHeight: 200,
                maxHeight: 300,
              ),
              child: Container(
                width: 500,
                height: 500,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  "Max Constraint Applied\n(300 x 300)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// =========================
            /// MIN SIZE EXAMPLE
            /// =========================
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 200,
                maxWidth: 300,
                minHeight: 200,
                maxHeight: 300,
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Min Constraint Applied\n(200 x 200)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}