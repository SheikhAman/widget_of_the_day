import 'package:flutter/material.dart';

enum _SlideFrom { left, right, top, bottom }

class Day149SlideTransition extends StatefulWidget {
  const Day149SlideTransition({super.key});

  @override
  State<Day149SlideTransition> createState() => _Day149SlideTransitionState();
}

class _Day149SlideTransitionState extends State<Day149SlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<Offset> _slideAnimation = const AlwaysStoppedAnimation(Offset.zero);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _setDirection(_SlideFrom.left);
  }

  // Rebuilds the Tween with a new starting OFFSCREEN offset, then
  // replays the animation from that new direction.
  void _setDirection(_SlideFrom from) {
    final Offset startOffset = switch (from) {
      _SlideFrom.left => const Offset(-1.5, 0), // fully off-screen left
      _SlideFrom.right => const Offset(1.5, 0), // fully off-screen right
      _SlideFrom.top => const Offset(0, -1.5), // fully off-screen top
      _SlideFrom.bottom => const Offset(0, 1.5), // fully off-screen bottom
    };

    setState(() {
      _slideAnimation =
          Tween<Offset>(
            begin: startOffset,
            end: Offset.zero, // Offset.zero = the widget's natural position
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
          );
    });

    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 149 - SlideTransition')),
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
                '➡️ SlideTransition animates position using FRACTIONS of '
                'the widget\'s own size — Offset(1, 0) means "one full '
                'width to the right", not a fixed pixel amount. Tap a '
                'direction to replay the entrance.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── The animated playground ─────────────────────────────
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
                  child: Center(
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: _card(),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Direction buttons ─────────────────────────────────
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              children: [
                _dirButton("From Left", Icons.arrow_forward, _SlideFrom.left),
                _dirButton("From Right", Icons.arrow_back, _SlideFrom.right),
                _dirButton("From Top", Icons.arrow_downward, _SlideFrom.top),
                _dirButton(
                  "From Bottom",
                  Icons.arrow_upward,
                  _SlideFrom.bottom,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dirButton(String label, IconData icon, _SlideFrom direction) {
    return OutlinedButton.icon(
      onPressed: () => _setDirection(direction),
      icon: Icon(icon, size: 16),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF6366F1),
        side: const BorderSide(color: Color(0xFF6366F1)),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.4),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.mail_outline, color: Colors.white, size: 40),
    );
  }
}
