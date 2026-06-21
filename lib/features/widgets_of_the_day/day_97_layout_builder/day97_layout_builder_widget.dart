import 'package:flutter/material.dart';

class Day97LayoutBuilder extends StatelessWidget {
  const Day97LayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 97 - LayoutBuilder"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Mobile view
          if (constraints.maxWidth < 600) {
            return Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  "MOBILE VIEW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }

          // Desktop / Tablet view
          return Row(
            children: [
              Container(
                width: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "SIDEBAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "CONTENT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}