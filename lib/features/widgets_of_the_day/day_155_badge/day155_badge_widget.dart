import 'package:flutter/material.dart';

/// Day 155: Badge (Material 3)
/// Real-world Example: Messaging & Shopping Notifications
///
/// PROBLEM: Showing a notification count on an icon usually requires complex
/// Stack logic with manual alignment and sizing.
///
/// SOLUTION: Badge is a standard Material 3 widget that automatically wraps
/// a child and places a status dot or a label (count) at the top-end corner.
class Day155BadgeWidget extends StatefulWidget {
  const Day155BadgeWidget({super.key});

  @override
  State<Day155BadgeWidget> createState() => _Day155BadgeWidgetState();
}

class _Day155BadgeWidgetState extends State<Day155BadgeWidget> {
  int _notifications = 5;
  bool _showMessages = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Day 155 - Badge'),
        actions: [
          // 1. SMALL STATUS BADGE (Just a dot)
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              top: 16.0,
              bottom: 16.0,
            ),
            child: Badge(
              isLabelVisible: _showMessages,
              child: const Icon(Icons.mark_email_unread_outlined),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 2. LARGE LABEL BADGE (With dynamic count)
              Badge.count(
                count: _notifications,
                largeSize: 24,
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 64,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 32),

              const Text(
                'Professional Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Badges help users focus on important updates without cluttering the UI.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(height: 50),

              // INTERACTIVE CONTROLS (To show recruiters state handling)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => setState(() => _notifications++),
                    icon: const Icon(Icons.add),
                    label: const Text('New Order'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.withValues(alpha: 0.1),
                      foregroundColor: Colors.green,
                      elevation: 0,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () =>
                        setState(() => _showMessages = !_showMessages),
                    icon: Icon(
                      _showMessages ? Icons.visibility_off : Icons.visibility,
                    ),
                    label: Text(_showMessages ? 'Hide Dot' : 'Show Dot'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.withValues(alpha: 0.1),
                      foregroundColor: Colors.indigo,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => setState(() => _notifications = 0),
                child: const Text(
                  'Clear All Notifications',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
