import 'package:flutter/material.dart';

class Day62ExpansionTileWidget extends StatelessWidget {
  const Day62ExpansionTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 62 - ExpansionTile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ExpansionTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                'What is Flutter?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Flutter is an open-source UI toolkit by Google for building natively compiled applications for mobile, web, and desktop from a single codebase.',
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Card(
            child: ExpansionTile(
              leading: Icon(Icons.code),
              title: Text(
                'Why use Flutter?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(title: Text('Fast Development')),
                ListTile(title: Text('Cross Platform')),
                ListTile(title: Text('Beautiful UI')),
                ListTile(title: Text('Single Codebase')),
              ],
            ),
          ),

          SizedBox(height: 10),

          Card(
            child: ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text(
                'How does it work?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(title: Text('Uses Widgets')),
                ListTile(title: Text('Everything is UI')),
                ListTile(title: Text('Hot Reload support')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}