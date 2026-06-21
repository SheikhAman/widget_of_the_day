import 'package:flutter/material.dart';

class Day90NullAwareOperatorsWidget extends StatelessWidget {
  const Day90NullAwareOperatorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ==============================
    // SAMPLE DATA (NULL SAFETY DEMO)
    // ==============================
    String? name = 'Flutter';
    String? city; // This is NULL
    String? country = 'Bangladesh';
    List<int>? numbers = [10, 20, 30];

    // ==============================
    // NULL SAFE OPERATIONS
    // ==============================

    /// ? → Safe access (prevents crash if null)
    final nameLower = name?.toLowerCase();
    final nameLength = name?.length;

    /// ?? → Default value if null
    final cityValue = city ?? 'No City Provided';

    /// ?? (safe fallback example)
    final countryValue = country ?? 'Unknown Country';

    /// ...? → Safe spread operator
    final numberList = [...?numbers];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 90 - Null Aware Operators"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HEADER
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'NULL SAFETY OPERATORS\n\n'
                    '?  → Safe Access\n'
                    '?? → Default Value\n'
                    '??= → Assign if Null\n'
                    '...? → Safe List Spread',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // ? OPERATOR
            // =========================
            const Text(
              "1️⃣ Safe Access Operator (?)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("name?.toLowerCase() → $nameLower"),
            Text("name?.length → $nameLength"),

            const SizedBox(height: 20),

            // =========================
            // ?? OPERATOR
            // =========================
            const Text(
              "2️⃣ Default Value Operator (??)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("city ?? 'No City' → $cityValue"),
            Text("country ?? fallback → $countryValue"),

            const SizedBox(height: 20),

            // =========================
            // ...? OPERATOR
            // =========================
            const Text(
              "3️⃣ Safe List Spread (...?)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("numbers list → $numberList"),

            const SizedBox(height: 20),

            // =========================
            // NOTE SECTION
            // =========================
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "💡 Tip:\n"
                    "Null safety prevents runtime crashes by handling null values safely.\n"
                    "This is very important in production apps.",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}