import 'package:flutter/material.dart';

class Day33ClipperWidget extends StatelessWidget {
  const Day33ClipperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 33 - Clipper'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 220,
                color: Colors.deepPurple.shade200,
              ),
            ),
          ),

          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 200,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: const Text(
                'Custom Clipper Wave',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Center(
            child: Text(
              'Create custom shapes\nusing ClipPath',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width * 0.20,
      size.height,
      size.width * 0.45,
      size.height - 40,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 100,
      size.width,
      size.height - 10,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}