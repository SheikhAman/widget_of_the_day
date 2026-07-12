import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Day139Feedback extends StatefulWidget {
  const Day139Feedback({super.key});

  @override
  State<Day139Feedback> createState() => _Day139FeedbackState();
}

class _Day139FeedbackState extends State<Day139Feedback> {
  int _feedbackTaps = 0;
  int _manualTaps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 139 - Feedback')),
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
                '📳 Feedback.forTap() automatically plays the CORRECT '
                'platform feedback for a tap — a click sound + vibration '
                'on Android, a light haptic on iOS — so you don\'t have '
                'to guess which HapticFeedback call to use yourself.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ── Option 1: Feedback.forTap ───────────────────────────
            const Text(
              "1. Feedback.forTap() — platform-correct",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                // Feedback.forTap() triggers the correct platform sound +
                // vibration for a tap. It's a METHOD you call, not a
                // widget — unlike InkWell, it has no `child` parameter.
                Feedback.forTap(context);
                setState(() => _feedbackTaps++);
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.touch_app_outlined,
                      color: Color(0xFF6366F1),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Tap me (Feedback.forTap)",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "$_feedbackTaps taps",
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),
            Text(
              "One line — Flutter picks the right sound + vibration for "
              "the current platform automatically.",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 28),

            // ── Option 2: manual HapticFeedback ─────────────────────
            const Text(
              "2. Manual HapticFeedback.vibrate() — DIY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                // You have to remember to trigger this YOURSELF, and pick
                // the "right" haptic call — no automatic platform sound.
                HapticFeedback.vibrate();
                setState(() => _manualTaps++);
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.touch_app_outlined, color: Colors.grey.shade500),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Tap me (manual vibrate)",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "$_manualTaps taps",
                      style: const TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),
            Text(
              "Works, but only gives vibration — no platform click sound, "
              "and you must call this in every single tappable widget.",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFC7D2FE)),
              ),
              child: const Text(
                "🔊 Try this on a real Android device with sound/vibration "
                "on — you'll hear and feel the difference between the "
                "two buttons above.",
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
