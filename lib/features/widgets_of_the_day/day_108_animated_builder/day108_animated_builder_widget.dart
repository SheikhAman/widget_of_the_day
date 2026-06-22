import 'dart:math' as math;
import 'package:flutter/material.dart';

const _primary = Color(0xFF4F46E5);

class Day108AnimatedBuilder extends StatefulWidget {
  const Day108AnimatedBuilder({super.key});

  @override
  State<Day108AnimatedBuilder> createState() => _Day108AnimatedBuilderState();
}

class _Day108AnimatedBuilderState extends State<Day108AnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  bool _isPaused = false;

  void _toggleAnimation() {
    setState(() {
      if (_isPaused) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
      _isPaused = !_isPaused;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 108 - AnimatedBuilder'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ── Step 1: What is AnimatedBuilder? ──────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _primary.withValues(alpha: 0.3),
                  ),
                ),
                child: const Text(
                  'AnimatedBuilder listens to an AnimationController '
                      'and rebuilds its builder on every tick — '
                      'without rebuilding the whole screen.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, height: 1.6),
                ),
              ),
            ),

            const SizedBox(height: 50),

            // ── Step 2: The animation itself ───────────────────────
            AnimatedBuilder(
              animation: _controller,
              // child is built ONCE — not on every frame
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: _primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    '🚀',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              builder: (context, child) {
                // This runs on every animation frame
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child, // reuses the child built above
                );
              },
            ),

            const SizedBox(height: 40),

            // ── Step 3: Live value display ─────────────────────────
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Text(
                  'Animation value: ${_controller.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: _primary,
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // ── Step 4: Pause / Play ───────────────────────────────
            ElevatedButton.icon(
              onPressed: _toggleAnimation,
              icon: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
              label: Text(_isPaused ? 'Resume' : 'Pause'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ── Step 5: Why use AnimatedBuilder? ──────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _tipCard(
                    icon: Icons.check_circle_outline,
                    color: Colors.green,
                    text: 'child is built once, reused every frame',
                  ),
                  const SizedBox(width: 10),
                  _tipCard(
                    icon: Icons.check_circle_outline,
                    color: Colors.green,
                    text: 'only builder reruns, not the whole tree',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tipCard({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 12, color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}