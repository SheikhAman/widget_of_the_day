import 'package:flutter/material.dart';

class Day34RawMaterialButtonWidget extends StatelessWidget {
  const Day34RawMaterialButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 34 - RawMaterialButton'),
      ),
      body: Center(
        child: RawMaterialButton(
          onPressed: () {},

          fillColor: Colors.indigoAccent,
          splashColor: Colors.indigo,
          elevation: 6.0,
          shape: const StadiumBorder(),

          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.explore,
                  color: Colors.amber,
                ),
              ),
              SizedBox(width: 12),
              Text(
                'PURCHASE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}