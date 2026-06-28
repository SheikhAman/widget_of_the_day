import 'package:flutter/material.dart';


class Day109SnackBar extends StatelessWidget {
  const Day109SnackBar({super.key});

  void _showSnackBar(
      BuildContext context, {
        required String message,
        required IconData icon,
        required Color color,
        String? actionLabel,
        VoidCallback? onAction,
      }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        action: actionLabel != null
            ? SnackBarAction(
          label: actionLabel,
          textColor: Colors.white,
          onPressed: onAction ?? () {},
        )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 109 - SnackBar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ── Info card ──────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFF4F46E5).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFF4F46E5).withValues(alpha: 0.3),
                ),
              ),
              child: const Text(
                'SnackBar shows a brief message at the bottom of the screen. '
                    'Use ScaffoldMessenger.of(context) to display it from anywhere in the widget tree.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, height: 1.6),
              ),
            ),

            const SizedBox(height: 40),

            // ── Simple SnackBar ────────────────────────────────────
            _snackBarButton(
              label: 'Simple SnackBar',
              icon: Icons.info_outline,
              color: Color(0xFF4F46E5),
              onPressed: () => _showSnackBar(
                context,
                message: 'This is a simple SnackBar!',
                icon: Icons.info_outline,
                color: Color(0xFF4F46E5),
              ),
            ),

            const SizedBox(height: 12),

            // ── Success SnackBar ───────────────────────────────────
            _snackBarButton(
              label: 'Success SnackBar',
              icon: Icons.check_circle_outline,
              color: Colors.green.shade600,
              onPressed: () => _showSnackBar(
                context,
                message: 'Changes saved successfully!',
                icon: Icons.check_circle_outline,
                color: Colors.green.shade600,
                actionLabel: 'View',
                onAction: () {},
              ),
            ),

            const SizedBox(height: 12),

            // ── Error SnackBar ─────────────────────────────────────
            _snackBarButton(
              label: 'Error SnackBar',
              icon: Icons.error_outline,
              color: Colors.red.shade600,
              onPressed: () => _showSnackBar(
                context,
                message: 'Something went wrong. Please try again.',
                icon: Icons.error_outline,
                color: Colors.red.shade600,
                actionLabel: 'Retry',
                onAction: () {},
              ),
            ),

            const SizedBox(height: 12),

            // ── Undo SnackBar ──────────────────────────────────────
            _snackBarButton(
              label: 'Undo SnackBar',
              icon: Icons.delete_outline,
              color: Colors.orange.shade700,
              onPressed: () => _showSnackBar(
                context,
                message: 'Item deleted.',
                icon: Icons.delete_outline,
                color: Colors.orange.shade700,
                actionLabel: 'Undo',
                onAction: () {
                  _showSnackBar(
                    context,
                    message: 'Deletion undone!',
                    icon: Icons.check_circle_outline,
                    color: Colors.green.shade600,
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // ── Tip cards ──────────────────────────────────────────
            Row(
              children: [
                _tipCard(
                  icon: Icons.layers_outlined,
                  text: 'floating behavior keeps it above bottom nav bars',
                ),
                const SizedBox(width: 10),
                _tipCard(
                  icon: Icons.timer_outlined,
                  text: 'duration controls how long it stays on screen',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _snackBarButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _tipCard({
    required IconData icon,
    required String text,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFF4F46E5).withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF4F46E5).withValues(alpha: 0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFF4F46E5), size: 16),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4F46E5).withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}