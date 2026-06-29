import 'package:flutter/material.dart';

class Day111IntrinsicWidgets extends StatelessWidget {
  const Day111IntrinsicWidgets({super.key});

  static const Color primaryColor = Color(0xFF4F46E5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 111 - Intrinsic Widgets'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: primaryColor.withValues(alpha: .3),
                ),
              ),
              child: const Text(
                'IntrinsicHeight and IntrinsicWidth make widgets match '
                    'the size of their largest sibling. They are useful for '
                    'creating clean and aligned layouts.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 30),

            _title('1. Without IntrinsicHeight ❌'),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: const Text(
                      'Short',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 120,
                    alignment: Alignment.center,
                    color: Colors.orange,
                    child: const Text(
                      'Tall',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            _title('2. With IntrinsicHeight ✅'),

            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: const Text(
                        'Short',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: const Text(
                        'Tall',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            _title('3. Without IntrinsicWidth ❌'),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save Changes"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            _title('4. With IntrinsicWidth ✅'),

            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save Changes"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                _tipCard(
                  Icons.height,
                  'IntrinsicHeight makes Row children equal in height.',
                ),
                const SizedBox(width: 10),
                _tipCard(
                  Icons.width_normal,
                  'IntrinsicWidth makes widgets use the same width.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _tipCard(IconData icon, String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: primaryColor.withValues(alpha: .06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor.withValues(alpha: .2),
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
                  color: primaryColor.withValues(alpha: .8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}