import 'package:flutter/material.dart';

class Day106Builder extends StatelessWidget {
  const Day106Builder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 106 - Builder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Section 1: What is Builder? ──────────────────────────
            _sectionCard(
              icon: Icons.info_outline,
              title: 'What is Builder?',
              description:
              'Builder is a widget that gives you a NEW BuildContext.\n\n'
                  'Sometimes the context from the parent widget is "too early" '
                  'and does not have access to things like Scaffold or Theme yet. '
                  'Builder solves this by creating a fresh context inside the widget tree.',
              color: Colors.blue.shade50,
              iconColor: Colors.blue,
            ),

            const SizedBox(height: 16),

            // ── Section 2: Live Theme Example ────────────────────────
            Builder(
              builder: (newContext) {
                // This newContext is INSIDE the widget tree,
                // so Theme.of(newContext) works perfectly here.
                final theme = Theme.of(newContext);
                return _sectionCard(
                  icon: Icons.palette_outlined,
                  title: 'Live Theme via Builder Context',
                  description:
                  'Primary color from theme: ${theme.colorScheme.primary}\n'
                      'Font family: ${theme.textTheme.bodyLarge?.fontFamily ?? "default"}\n\n'
                      'This data was read using the NEW context provided by Builder.',
                  color: Colors.purple.shade50,
                  iconColor: Colors.purple,
                );
              },
            ),

            const SizedBox(height: 16),

            // ── Section 3: Scaffold.of() Example ────────────────────
            Builder(
              builder: (scaffoldContext) {
                return _sectionCard(
                  icon: Icons.notifications_outlined,
                  title: 'Scaffold.of() works here',
                  description:
                  'Tap the button below to show a SnackBar.\n\n'
                      'Without Builder, calling Scaffold.of(context) in build() '
                      'would throw an error because the context is above the Scaffold.',
                  color: Colors.green.shade50,
                  iconColor: Colors.green,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // scaffoldContext is BELOW Scaffold, so this works!
                      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                        const SnackBar(
                          content: Text(
                              '✅ SnackBar shown using Builder context!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.send),
                    label: const Text('Show SnackBar'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ── Reusable card widget ─────────────────────────────────────────
  Widget _sectionCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Color iconColor,
    Widget? child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 13, height: 1.5),
          ),
          if (child != null) ...[
            const SizedBox(height: 12),
            child,
          ],
        ],
      ),
    );
  }
}