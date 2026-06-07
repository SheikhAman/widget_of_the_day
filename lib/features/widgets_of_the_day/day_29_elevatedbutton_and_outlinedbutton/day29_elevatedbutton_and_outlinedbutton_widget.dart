import 'package:flutter/material.dart';

class Day29ElevatedButtonAndOutlinedButtonWidget extends StatelessWidget {
  const Day29ElevatedButtonAndOutlinedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 29 - Buttons'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              const Text("------------------ ElevatedButton -----------------"),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text(
              'StadiumBorder',
              style: TextStyle(fontSize: 15),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'RoundedRectangleBorder',
              style: TextStyle(fontSize: 15),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24),
            ),
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'CircularBorder',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'BeveledRectangleBorder',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Text("------------------ OutlinedButton -----------------"),
          OutlinedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text(
              'StadiumBorder',
              style: TextStyle(fontSize: 15),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'RoundedRectangleBorder',
              style: TextStyle(fontSize: 15),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24),
            ),
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'CircularBorder',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'BeveledRectangleBorder',
              style: TextStyle(fontSize: 15),
            ),
          ),
          ]
        ),
        )
    );
  }


}