import 'package:flutter/material.dart';

/// A reusable action button specifically styled for the counter example.
/// Recruiter Tip: Separating small components into their own files shows
/// a clean modular architecture mindset.
class CounterActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CounterActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withValues(alpha: 0.1),
        foregroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.all(16),
        shape: const CircleBorder(),
      ),
      child: Icon(icon),
    );
  }
}
