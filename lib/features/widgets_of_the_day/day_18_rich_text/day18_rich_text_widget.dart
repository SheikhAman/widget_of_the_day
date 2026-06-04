import 'package:flutter/material.dart';

class Day18RichTextWidget extends StatelessWidget {
  const Day18RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 18 - RichText"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Dummy post area (like Instagram post)
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // RichText caption
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.5,
                ),

                children: [

                  TextSpan(
                    text: "mitch_koko ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  TextSpan(
                    text:
                    "This is a demo caption showing how RichText works in Flutter. "
                        "It allows multiple styles inside a single text widget, just like Instagram captions.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Hashtags (real-world usage)
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14),

                children: [
                  TextSpan(
                    text: "#flutter ",
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: "#ui ",
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: "#mobiledevelopment",
                    style: TextStyle(color: Colors.blue),
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