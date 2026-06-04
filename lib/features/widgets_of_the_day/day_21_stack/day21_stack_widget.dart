import 'package:flutter/material.dart';

class Day21StackWidget extends StatelessWidget {
  const Day21StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 21 - Stack"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // Profile Card
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40),

                  Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Building beautiful mobile applications with Flutter.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Profile Avatar
            const Positioned(
              top: -35,
              left: 110,
              child: CircleAvatar(
                radius: 35,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),

            // Online Indicator
            Positioned(
              top: -5,
              left: 160,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
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