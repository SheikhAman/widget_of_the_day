import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_80_pageroute_builder/bouncy_pageroute.dart';

class Day80PageRouteBuilderWidget extends StatelessWidget {
  const Day80PageRouteBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 80 - PageRouteBuilder'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.person),
          label: const Text('Open Profile'),
          onPressed: () {
            Navigator.push(
              context,
              BouncyPageRoute(
                page: const ProfileScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=400&q=80',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Custom navigation animation using PageRouteBuilder',
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}