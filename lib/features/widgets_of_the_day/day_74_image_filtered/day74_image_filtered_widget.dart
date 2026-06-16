import 'dart:ui';
import 'package:flutter/material.dart';

class Day74ImageFilteredWidget extends StatelessWidget {
  const Day74ImageFilteredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 74 - ImageFiltered'),
      ),
      body: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 8,sigmaY: 8,),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child:  Image.network(
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=1200',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}