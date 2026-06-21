import 'package:flutter/material.dart';

class Day98OrientationBuilder extends StatelessWidget {
  const Day98OrientationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text("Day 98 - OrientationBuilder"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortrait()
              : buildLandscape();
        },
      ),
    );
  }

  /// ======================
  /// PORTRAIT UI
  /// ======================
  Widget buildPortrait() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        buildImage(),
        const SizedBox(height: 16),
        buildText(),
      ],
    );
  }

  /// ======================
  /// LANDSCAPE UI
  /// ======================
  Widget buildLandscape() {
    return Row(
      children: [
        Expanded(child: buildImage()),
        const SizedBox(width: 12),
        Expanded(
          child: SingleChildScrollView(child: buildText()),
        ),
      ],
    );
  }

  /// ======================
  /// IMAGE WIDGET
  /// ======================
  Widget buildImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1585129819171-80b02d4c85b0',
      fit: BoxFit.cover,
    );
  }

  /// ======================
  /// TEXT WIDGET
  /// ======================
  Widget buildText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hair Styling",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "The history of hair styling dates back thousands of years..."
              " Hairstyles have evolved across cultures and time periods, "
              "reflecting fashion, identity, and social status.",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}