import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Language'),
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: Text('Privacy'),
        ),
      ],
    );
  }
}