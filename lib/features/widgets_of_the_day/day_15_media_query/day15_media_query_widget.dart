import 'package:flutter/material.dart';

class Day15MediaQueryWidget extends StatelessWidget {
  const Day15MediaQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 15 - MediaQuery"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              _InfoCard(
                title: "Screen Height",
                value: "${size.height.toStringAsFixed(2)} px",
                icon: Icons.height,
                color: Colors.purple,
              ),
          
              const SizedBox(height: 12),
          
              _InfoCard(
                title: "Screen Width",
                value: "${size.width.toStringAsFixed(2)} px",
                icon: Icons.width_normal,
                color: Colors.blue,
              ),
          
              const SizedBox(height: 12),
          
              _InfoCard(
                title: "Aspect Ratio",
                value: size.aspectRatio.toStringAsFixed(2),
                icon: Icons.aspect_ratio,
                color: Colors.green,
              ),
          
              const SizedBox(height: 12),
          
              _InfoCard(
                title: "Orientation",
                value: orientation.toString().split('.').last,
                icon: Icons.screen_rotation,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}