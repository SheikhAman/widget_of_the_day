import 'package:flutter/material.dart';

class Day137DraggableScrollableSheet extends StatefulWidget {
  const Day137DraggableScrollableSheet({super.key});

  @override
  State<Day137DraggableScrollableSheet> createState() =>
      _Day137DraggableScrollableSheetState();
}

class _Day137DraggableScrollableSheetState
    extends State<Day137DraggableScrollableSheet> {
  // Lets us jump the sheet to a specific height from a button press.
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  void _jumpTo(double size) {
    _sheetController.animateTo(
      size,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── The "map" behind the sheet ──────────────────────────────
      body: Stack(
        children: [
          _mapPlaceholder(),

          // Small floating buttons to jump the sheet programmatically —
          // just like tapping a ride option jumps Uber's sheet up.
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(child: _jumpButton("Min", () => _jumpTo(0.15))),
                const SizedBox(width: 8),
                Expanded(child: _jumpButton("Mid", () => _jumpTo(0.45))),
                const SizedBox(width: 8),
                Expanded(child: _jumpButton("Max", () => _jumpTo(0.9))),
              ],
            ),
          ),

          // ── The draggable sheet itself ─────────────────────────
          DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: 0.45, // starts at 45% of the screen
            minChildSize: 0.15, // can't be dragged smaller than 15%
            maxChildSize: 0.9, // can't be dragged taller than 90%
            snap: true, // snaps to the nearest stop instead of resting anywhere
            snapSizes: const [0.15, 0.45, 0.9], // the 3 stop points
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20)],
                ),
                child: ListView.builder(
                  // IMPORTANT: use the scrollController the builder gives
                  // you — this is what links dragging the sheet to
                  // scrolling the list inside it.
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          // Drag handle — a visual hint that this sheet drags.
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Nearby Rides",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    }
                    return _rideOption(index);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _mapPlaceholder() {
    return Container(
      color: const Color(0xFFE0E7FF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map_outlined, size: 64, color: Colors.indigo.shade200),
          const SizedBox(height: 12),
          Text(
            "🗺️ Map goes here",
            style: TextStyle(color: Colors.indigo.shade300, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            "Drag the sheet below — it snaps to Min / Mid / Max",
            style: TextStyle(color: Colors.indigo.shade300, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _jumpButton(String label, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6366F1),
        elevation: 3,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _rideOption(int index) {
    final rides = ["Economy", "Comfort", "XL", "Premium"];
    final prices = ["\$8.20", "\$11.50", "\$15.00", "\$22.00"];
    final ride = rides[index % rides.length];
    final price = prices[index % prices.length];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7FB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.directions_car,
                color: Color(0xFF6366F1),
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                ride,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
