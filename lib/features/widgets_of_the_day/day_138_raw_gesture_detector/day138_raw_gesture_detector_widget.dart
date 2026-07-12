import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Day138RawGestureDetector extends StatefulWidget {
  const Day138RawGestureDetector({super.key});

  @override
  State<Day138RawGestureDetector> createState() =>
      _Day138RawGestureDetectorState();
}

class _Day138RawGestureDetectorState extends State<Day138RawGestureDetector> {
  // The box's current position inside the play area.
  Offset _position = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 138 - RawGestureDetector')),
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
                '🎮 GestureDetector gives you ready-made callbacks like '
                'onPanUpdate. RawGestureDetector lets you wire up the '
                'SAME underlying recognizer yourself — the first step '
                'toward building a fully custom one.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Drag the purple box around.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),

            const SizedBox(height: 20),

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
                  child: RawGestureDetector(
                    // ── The core of this widget ────────────────────
                    // Instead of GestureDetector's built-in onPanUpdate
                    // shortcut, we register a raw PanGestureRecognizer
                    // ourselves. This is the exact mechanism you'd use
                    // to swap in a fully custom recognizer later.
                    gestures: {
                      PanGestureRecognizer:
                          GestureRecognizerFactoryWithHandlers<
                            PanGestureRecognizer
                          >(() => PanGestureRecognizer(), (recognizer) {
                            recognizer.onUpdate = (details) {
                              setState(() {
                                _position += details.delta;
                              });
                            };
                          }),
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          left: _position.dx,
                          top: _position.dy,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.open_with,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "Position: (${_position.dx.toStringAsFixed(0)}, "
              "${_position.dy.toStringAsFixed(0)})",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
