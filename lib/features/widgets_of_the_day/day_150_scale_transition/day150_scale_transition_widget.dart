import 'package:flutter/material.dart';

class Day150ScaleTransition extends StatefulWidget {
  const Day150ScaleTransition({super.key});

  @override
  State<Day150ScaleTransition> createState() => _Day150ScaleTransitionState();
}

class _Day150ScaleTransitionState extends State<Day150ScaleTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  Alignment _pivot = Alignment.center;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    // easeOutBack gives it a little "pop" — overshooting slightly past
    // full size before settling, like a FAB or dialog appearing.
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
  }

  void _toggle() {
    setState(() => _isVisible = !_isVisible);
    _isVisible ? _controller.forward() : _controller.reverse();
  }

  void _setPivot(Alignment alignment) {
    setState(() => _pivot = alignment);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 150 - ScaleTransition')),
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
                '🔍 ScaleTransition zooms a widget from nothing up to its '
                'full size — used for FAB pop-ins, dialogs appearing, '
                'and card-expand effects. The `alignment` decides which '
                'point it grows FROM.',
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
                child: Center(
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    // This is the pivot point the scaling grows FROM —
                    // center grows evenly outward, a corner grows like
                    // it's expanding out of that corner.
                    alignment: _pivot,
                    child: _card(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Pivot point:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _pivotChip("Center", Alignment.center),
                _pivotChip("Top Left", Alignment.topLeft),
                _pivotChip("Bottom Right", Alignment.bottomRight),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _toggle,
              icon: Icon(_isVisible ? Icons.close : Icons.add),
              label: Text(_isVisible ? "Scale Out" : "Scale In"),
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

  Widget _pivotChip(String label, Alignment alignment) {
    final isSelected = _pivot == alignment;
    return ChoiceChip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      selected: isSelected,
      onSelected: (_) => _setPivot(alignment),
      selectedColor: const Color(0xFF6366F1),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
      backgroundColor: Colors.grey.shade100,
    );
  }

  Widget _card() {
    return Container(
      width: 130,
      height: 130,
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
      child: const Icon(Icons.star, color: Colors.white, size: 40),
    );
  }
}
