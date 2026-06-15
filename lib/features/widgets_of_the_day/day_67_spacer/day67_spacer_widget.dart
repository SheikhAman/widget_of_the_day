import 'package:flutter/material.dart';

class Day67SpacerWidget extends StatelessWidget {
  const Day67SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 67 - Spacer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'John Smith',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}