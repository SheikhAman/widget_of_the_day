import 'package:flutter/material.dart';

class Day02ExpandedWidget extends StatelessWidget {
  const Day02ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 02 - Expanded'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection(
              title: 'Flex: 2',
              color: Colors.deepPurple,
              icon: Icons.star,
            ),
            const SizedBox(height: 12),
            _buildSection(
              title: 'Flex: 3',
              color: Colors.pink,
              icon: Icons.favorite,
              flex: 3,
            ),
            const SizedBox(height: 12),
            _buildSection(
              title: 'Flex: 3',
              color: Colors.green,
              icon: Icons.eco,
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Color color,
    required IconData icon,
    int flex = 2,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Expanded(flex: $flex)',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}