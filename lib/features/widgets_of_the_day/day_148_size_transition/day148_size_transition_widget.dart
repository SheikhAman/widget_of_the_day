import 'package:flutter/material.dart';

class Day148SizeTransition extends StatefulWidget {
  const Day148SizeTransition({super.key});

  @override
  State<Day148SizeTransition> createState() => _Day148SizeTransitionState();
}

class _Day148SizeTransitionState extends State<Day148SizeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    // sizeFactor drives HOW MUCH of the child is visible — 0.0 = fully
    // clipped away (invisible), 1.0 = fully shown.
    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
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
      appBar: AppBar(title: const Text('Day 148 - SizeTransition')),
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
                '📂 SizeTransition clips a widget as it grows or shrinks — '
                'the content doesn\'t scale, it gets revealed or hidden '
                'vertically, like a drawer sliding open. Perfect for '
                'accordion / FAQ-style expand-collapse sections.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── The accordion ─────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // ── Header (always visible, tappable) ────────────
                  InkWell(
                    onTap: _toggle,
                    borderRadius: BorderRadius.circular(14),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.help_outline,
                            color: Color(0xFF6366F1),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "What is SizeTransition?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Rotates the chevron as the accordion opens.
                          RotationTransition(
                            turns: Tween(
                              begin: 0.0,
                              end: 0.5,
                            ).animate(_controller),
                            child: const Icon(Icons.expand_more),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── The collapsible body ──────────────────────────
                  SizeTransition(
                    sizeFactor: _sizeAnimation,
                    axisAlignment: -1.0, // grows downward from the top
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: Text(
                        "It's a widget that animates its own size by "
                        "clipping its child, rather than scaling it — "
                        "so text stays crisp and readable throughout "
                        "the whole expand/collapse animation.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Text(
              _isExpanded
                  ? "sizeFactor → 1.0 (fully shown)"
                  : "sizeFactor → 0.0 (fully clipped)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
