import 'package:flutter/material.dart';

class Day145TweenAnimationBuilder extends StatefulWidget {
  const Day145TweenAnimationBuilder({super.key});

  @override
  State<Day145TweenAnimationBuilder> createState() =>
      _Day145TweenAnimationBuilderState();
}

class _Day145TweenAnimationBuilderState
    extends State<Day145TweenAnimationBuilder> {
  double _targetSize = 100;
  Color _targetColor = const Color(0xFF6366F1);

  void _randomize() {
    setState(() {
      _targetSize = _targetSize == 100 ? 180 : 100;
      _targetColor = _targetColor == const Color(0xFF6366F1)
          ? const Color(0xFFF97316)
          : const Color(0xFF6366F1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 145 - TweenAnimationBuilder')),
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
                '🎬 TweenAnimationBuilder animates a value from old → new '
                'automatically, any time that value changes — no '
                'AnimationController, no vsync, no dispose() needed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ── The animated box ─────────────────────────────────────
            Expanded(
              child: Center(
                // Every time _targetSize or _targetColor changes, this
                // widget automatically animates from the OLD value to
                // the NEW one — we never manually tell it to animate.
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: _targetSize),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutBack,
                  builder: (context, size, child) {
                    // Curves.easeInOutBack deliberately overshoots PAST
                    // its start value for a springy effect — which can
                    // briefly dip below 0. Clamp it so width/height
                    // never goes negative.
                    final safeSize = size.clamp(0.0, double.infinity);
                    return Container(
                      width: safeSize,
                      height: safeSize,
                      decoration: BoxDecoration(
                        color: _targetColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      alignment: Alignment.center,
                      child: child,
                    );
                  },
                  // `child` is built ONCE and reused every frame — it
                  // doesn't rebuild along with the animation, which is
                  // a nice free performance win.
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _randomize,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Change Size & Color",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "No AnimationController • No SingleTickerProviderStateMixin • No dispose()",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
