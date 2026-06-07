import 'package:flutter/material.dart';

class Day24SliderWidget extends StatefulWidget {
  const Day24SliderWidget({super.key});

  @override
  State<Day24SliderWidget> createState() => _Day24SliderWidgetState();
}

class _Day24SliderWidgetState extends State<Day24SliderWidget> {
  double _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Day 24 - Slider'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.volume_up,
                size: 80,
                color: Colors.indigo,
              ),

              const SizedBox(height: 20),

              Text(
                '${_currentValue.toInt()}%',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Slider(
                value: _currentValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: '${_currentValue.toInt()}%',
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}