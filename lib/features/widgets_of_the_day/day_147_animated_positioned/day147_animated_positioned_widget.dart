import 'package:flutter/material.dart';

class Day147AnimatedPositioned extends StatefulWidget {
  const Day147AnimatedPositioned({super.key});

  @override
  State<Day147AnimatedPositioned> createState() =>
      _Day147AnimatedPositionedState();
}

class _Day147AnimatedPositionedState extends State<Day147AnimatedPositioned> {
  bool _isTopLeft = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 147 - AnimatedPositioned')),
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
                '📍 A plain Positioned widget JUMPS instantly when its '
                'values change. AnimatedPositioned smoothly slides '
                'between the old and new position instead — no '
                'AnimationController needed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Tap the button to move the card between corners.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),

            const SizedBox(height: 20),

            // ── The Stack playground ─────────────────────────────────
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      // AnimatedPositioned needs to live directly inside
                      // a Stack, just like a normal Positioned widget —
                      // the only difference is it animates changes.
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeInOutCubic,
                        top: _isTopLeft ? 20 : null,
                        bottom: _isTopLeft ? null : 20,
                        left: _isTopLeft ? 20 : null,
                        right: _isTopLeft ? null : 20,
                        child: _card(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () {
                setState(() => _isTopLeft = !_isTopLeft);
              },
              icon: Icon(
                _isTopLeft ? Icons.arrow_downward : Icons.arrow_upward,
              ),
              label: Text(
                _isTopLeft ? "Move to Bottom-Right" : "Move to Top-Left",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.credit_card, color: Colors.white, size: 32),
    );
  }
}
