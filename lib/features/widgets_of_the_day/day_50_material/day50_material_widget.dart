import 'package:flutter/material.dart';

class Day50MaterialWidget extends StatelessWidget {
  const Day50MaterialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 50 - Material'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ---------------- Card Style Material ----------------
            Material(
              color: Colors.red,
              elevation: 12,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 140,
                width: 140,
                child: Center(
                  child: Text(
                    'Material Box',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- ListTile Material ----------------
            const Material(
              color: Colors.deepOrange,
              elevation: 8,
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white),
                title: Text(
                  'Material ListTile',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'With elevation shadow',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- Simple Text Material ----------------
            const Material(
              color: Colors.amber,
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Material gives elevation + shadow to any widget',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}