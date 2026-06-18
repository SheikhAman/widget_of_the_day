import 'package:flutter/material.dart';

class Day85CircleAvatarWidget extends StatelessWidget {
  const Day85CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text('Day 85 – CircleAvatar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ─────────────────────────────────────────
            // 1. Basic CircleAvatar with a network image
            //    radius controls the size of the circle
            // ─────────────────────────────────────────
            const Text('1. Basic CircleAvatar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            const Center(
              child: CircleAvatar(
                radius: 50, // 👈 change this to make it bigger or smaller
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=500',
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ─────────────────────────────────────────
            // 2. backgroundColor as a border ring
            //    Wrap a bigger CircleAvatar around a
            //    smaller one to fake a border
            // ─────────────────────────────────────────
            const Text('2. Avatar with Border Ring',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            const Center(
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.blue, // 👈 this becomes the ring color
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=500',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ─────────────────────────────────────────
            // 3. Stack + Positioned: cover photo with
            //    avatar overlapping it
            // ─────────────────────────────────────────
            const Text('3. Stack & Positioned Profile Card',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Stack lets widgets sit on top of each other
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      // Cover image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Positioned places the avatar halfway over the cover
                      const Positioned(
                        bottom: -40, // 👈 negative = moves it down/outside
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.white, // white ring
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=500',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Extra top padding so text clears the overlapping avatar
                  const SizedBox(height: 52),

                  // Name & title
                  const Text(
                    'John Doe',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '📍 San Francisco, CA',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 16),

                  // Skills
                  const Wrap(
                    spacing: 8,
                    children: [
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('Dart')),
                      Chip(label: Text('Firebase')),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Contact button
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('Contact Me'),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}