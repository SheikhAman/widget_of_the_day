import 'package:flutter/material.dart';

class Day43ClipPathWidget extends StatelessWidget {
  const Day43ClipPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 43 - ClipPath'),
      ),
      body: Center(
        child: ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 250,
            width: double.infinity,
            color: Colors.deepPurple,
            alignment: Alignment.center,
            child: const Text(
              'ClipPath Widget',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
      size.width * 0.5,
      size.height - 100,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}