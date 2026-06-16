import 'package:flutter/material.dart';

class Day75AspectRatioWidget extends StatelessWidget {
  const Day75AspectRatioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 75 - AspectRatio'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AspectRatioCard(
            ratio: 3 / 2,
            title: 'Aspect Ratio 3:2',
            image:
            'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200',
          ),
          SizedBox(height: 16),
          AspectRatioCard(
            ratio: 3 / 1,
            title: 'Aspect Ratio 3:1 (Wide Banner)',
            image:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=1200&q=80',
          ),
          SizedBox(height: 16),
          AspectRatioCard(
            ratio: 5 / 1,
            title: 'Aspect Ratio 5:1 (Hero Banner)',
            image:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1200',
          ),
        ],
      ),
    );
  }
}

class AspectRatioCard extends StatelessWidget {
  final double ratio;
  final String title;
  final String image;

  const AspectRatioCard({
    super.key,
    required this.ratio,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: ratio,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}