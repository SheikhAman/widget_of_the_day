import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum _TimeRange { day, week, month }

class Day142CupertinoSlidingSegmentedControl extends StatefulWidget {
  const Day142CupertinoSlidingSegmentedControl({super.key});

  @override
  State<Day142CupertinoSlidingSegmentedControl> createState() =>
      _Day142CupertinoSlidingSegmentedControlState();
}

class _Day142CupertinoSlidingSegmentedControlState
    extends State<Day142CupertinoSlidingSegmentedControl> {
  _TimeRange _selected = _TimeRange.week;

  final Map<_TimeRange, String> _labels = {
    _TimeRange.day: "1,204",
    _TimeRange.week: "8,932",
    _TimeRange.month: "34,510",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 142 - CupertinoSlidingSegmentedControl'),
      ),
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
                '🍏 CupertinoSlidingSegmentedControl is the iOS-style tab '
                'switcher with a smooth sliding thumb — seen in Health, '
                'Maps, and Settings on iPhone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── The segmented control ────────────────────────────────
            CupertinoSlidingSegmentedControl<_TimeRange>(
              groupValue: _selected,
              backgroundColor: const Color(0xFFE5E7EB),
              thumbColor: Colors.white,
              children: const {
                _TimeRange.day: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Day"),
                ),
                _TimeRange.week: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Week"),
                ),
                _TimeRange.month: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Month"),
                ),
              },
              onValueChanged: (value) {
                // onValueChanged can technically fire with null — guard
                // against that before updating state.
                if (value != null) {
                  setState(() => _selected = value);
                }
              },
            ),

            const SizedBox(height: 32),

            // ── Content that reacts to the selected segment ──────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
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
              child: Column(
                children: [
                  Text(
                    "Steps — this ${_selected.name}",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _labels[_selected]!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6366F1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
