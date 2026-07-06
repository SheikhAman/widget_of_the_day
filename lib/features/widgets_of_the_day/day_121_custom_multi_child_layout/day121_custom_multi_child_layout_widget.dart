import 'package:flutter/material.dart';

// ── Step 1: Give each child a name (an ID) ──────────────────────────
enum _Slot { red, green, blue }

// ── Step 2: Tell each child exactly where to go ─────────────────────
class _SimpleLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // Red box → top-left corner
    if (hasChild(_Slot.red)) {
      layoutChild(_Slot.red, BoxConstraints.tight(const Size(80, 80)));
      positionChild(_Slot.red, const Offset(0, 0));
    }

    // Green box → top-right corner
    if (hasChild(_Slot.green)) {
      layoutChild(_Slot.green, BoxConstraints.tight(const Size(80, 80)));
      positionChild(_Slot.green, Offset(size.width - 80, 0));
    }

    // Blue box → bottom-center
    if (hasChild(_Slot.blue)) {
      layoutChild(_Slot.blue, BoxConstraints.tight(const Size(80, 80)));
      positionChild(
        _Slot.blue,
        Offset((size.width - 80) / 2, size.height - 80),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

class Day121CustomMultiChildLayout extends StatefulWidget {
  const Day121CustomMultiChildLayout({super.key});

  @override
  State<Day121CustomMultiChildLayout> createState() =>
      _Day121CustomMultiChildLayoutState();
}

class _Day121CustomMultiChildLayoutState
    extends State<Day121CustomMultiChildLayout> {
  bool _useCustomLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Day 121 - CustomMultiChildLayout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4F46E5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'CustomMultiChildLayout lets you give each child a name (an ID), '
                'then place every child at an exact position using a '
                'MultiChildLayoutDelegate. Think of it as Stack, but with full '
                'control over where every single child goes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Text(
              _useCustomLayout
                  ? 'With CustomMultiChildLayout ✅'
                  : 'Without It (plain Row) ❌',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),

            const SizedBox(height: 20),

            Container(
              width: 280,
              height: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _useCustomLayout
                  ? CustomMultiChildLayout(
                      delegate: _SimpleLayoutDelegate(),
                      children: [
                        LayoutId(id: _Slot.red, child: _box(Colors.red, "1")),
                        LayoutId(
                          id: _Slot.green,
                          child: _box(Colors.green, "2"),
                        ),
                        LayoutId(id: _Slot.blue, child: _box(Colors.blue, "3")),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _box(Colors.red, "1"),
                        _box(Colors.green, "2"),
                        _box(Colors.blue, "3"),
                      ],
                    ),
            ),

            const SizedBox(height: 24),

            Text(
              _useCustomLayout
                  ? "Each box is pinned to an exact corner — top-left, top-right, "
                        "and bottom-center."
                  : "A plain Row can only place boxes in one line, side by side.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _useCustomLayout
                    ? Colors.green.shade700
                    : Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _useCustomLayout = !_useCustomLayout;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _useCustomLayout
                      ? "Switch to Plain Row"
                      : "Switch to CustomMultiChildLayout",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _box(Color color, String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
