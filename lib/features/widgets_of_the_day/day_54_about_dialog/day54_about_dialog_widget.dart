import 'package:flutter/material.dart';

class Day54AboutDialogWidget extends StatelessWidget {
  const Day54AboutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 54 - AboutDialog'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationIcon: const FlutterLogo(size: 60),
              applicationName: 'Flutter Widget of the Day',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2026 Sheikh Aman',
              children: const [
                SizedBox(height: 12),
                Text(
                  'A collection of Flutter widget examples designed to help beginners learn Flutter and build beautiful user interfaces.',
                ),
              ],
            );
          },
          icon: const Icon(Icons.info_outline),
          label: const Text('Show About Dialog'),
        ),
      ),
    );
  }
}