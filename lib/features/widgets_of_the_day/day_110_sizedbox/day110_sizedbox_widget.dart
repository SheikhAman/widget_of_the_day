import 'package:flutter/material.dart';

class Day110SizedBox extends StatelessWidget {
  const Day110SizedBox({super.key});

  static const Color primaryColor = Color(0xFF4F46E5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 110 - SizedBox'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Info Card ──────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: primaryColor.withValues(alpha: 0.3),
                ),
              ),
              child: const Text(
                'SizedBox is used to add spacing or give a widget a fixed size. '
                    'It also provides constructors like expand(), shrink(), and fromSize() '
                    'for different layout scenarios.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ── Fixed Width & Height ───────────────────────────────
            _title('1. Fixed Width & Height'),

            SizedBox(
              width: 180,
              height: 60,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '180 × 60',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ── Spacing ────────────────────────────────────────────
            _title('2. Vertical Spacing'),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text('Text Above'),
                  SizedBox(height: 20),
                  Text('Text Below'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ── Expand ─────────────────────────────────────────────
            _title('3. SizedBox.expand()'),

            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox.expand(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Fills Parent',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ── Shrink ─────────────────────────────────────────────
            _title('4. SizedBox.shrink()'),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text('Before'),
                  SizedBox.shrink(),
                  Text('After'),
                  SizedBox(height: 8),
                  Text(
                    'SizedBox.shrink() takes zero width and zero height.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ── From Size ──────────────────────────────────────────
            _title('5. SizedBox.fromSize()'),

            SizedBox.fromSize(
              size: const Size(180, 60),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'fromSize()',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ── Tips ───────────────────────────────────────────────
            Row(
              children: [
                _tipCard(
                  icon: Icons.space_bar,
                  text:
                  'Use SizedBox instead of an empty Container when you only need spacing.',
                ),
                const SizedBox(width: 10),
                _tipCard(
                  icon: Icons.lightbulb_outline,
                  text:
                  'expand() fills space, shrink() becomes zero size, and fromSize() uses a Size object.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _tipCard({
    required IconData icon,
    required String text,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: primaryColor.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 16,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: primaryColor.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}