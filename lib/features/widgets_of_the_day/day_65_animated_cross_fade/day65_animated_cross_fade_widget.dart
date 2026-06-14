import 'package:flutter/material.dart';

class Day65AnimatedCrossFadeWidget extends StatefulWidget {
  const Day65AnimatedCrossFadeWidget({super.key});

  @override
  State<Day65AnimatedCrossFadeWidget> createState() =>
      _Day65AnimatedCrossFadeWidgetState();
}

class _Day65AnimatedCrossFadeWidgetState
    extends State<Day65AnimatedCrossFadeWidget> {
  bool showProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 65 - AnimatedCrossFade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 800),
              crossFadeState: showProfile
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: _buildProfileCard(
                imageUrl:
                'https://randomuser.me/api/portraits/men/32.jpg',
                name: 'John Smith',
                role: 'Flutter Developer',
              ),
              secondChild: _buildProfileCard(
                imageUrl:
                'https://randomuser.me/api/portraits/women/44.jpg',
                name: 'Sarah Wilson',
                role: 'UI/UX Designer',
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showProfile = !showProfile;
                });
              },
              child: const Text('Switch Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String imageUrl,
    required String name,
    required String role,
  }) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: 280,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                role,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}