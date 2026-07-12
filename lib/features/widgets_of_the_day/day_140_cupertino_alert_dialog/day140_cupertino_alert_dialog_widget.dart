import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Day140CupertinoAlertDialog extends StatelessWidget {
  const Day140CupertinoAlertDialog({super.key});

  // ── Material (Android-style) dialog ─────────────────────────────
  void _showMaterialDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete photo?"),
        content: const Text("This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // ── Cupertino (iOS-style) dialog ────────────────────────────────
  void _showCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Delete photo?"),
        content: const Text("This action cannot be undone."),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true, // colors the text red, iOS-style
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 140 - CupertinoAlertDialog')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '🍎 CupertinoAlertDialog looks and behaves like a native '
                'iOS alert — blurred background, centered title, '
                'stacked text-only buttons — instead of Material\'s '
                'Android-style dialog with a solid card and row buttons.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              "Tap each button to compare the two dialog styles side by side.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),

            const SizedBox(height: 28),

            // ── Material trigger ─────────────────────────────────────
            _dialogTrigger(
              context,
              icon: Icons.android,
              title: "Material AlertDialog",
              subtitle: "Android-style — solid card, row buttons",
              color: const Color(0xFF3DDC84),
              onTap: () => _showMaterialDialog(context),
            ),

            const SizedBox(height: 16),

            // ── Cupertino trigger ────────────────────────────────────
            _dialogTrigger(
              context,
              icon: Icons.phone_iphone,
              title: "CupertinoAlertDialog",
              subtitle: "iOS-style — blurred background, stacked buttons",
              color: Colors.grey.shade800,
              onTap: () => _showCupertinoDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dialogTrigger(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}
