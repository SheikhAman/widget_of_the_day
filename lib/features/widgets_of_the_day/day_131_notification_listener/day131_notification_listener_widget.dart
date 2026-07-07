import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Day131NotificationListener extends StatefulWidget {
  const Day131NotificationListener({super.key});

  @override
  State<Day131NotificationListener> createState() =>
      _Day131NotificationListenerState();
}

class _Day131NotificationListenerState
    extends State<Day131NotificationListener> {
  bool _showFab = true;
  String _lastEvent = "Waiting for scroll...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 131 - NotificationListener')),
      // A FAB that hides on scroll-down and reappears on scroll-up —
      // a pattern you've seen in almost every social/e-commerce app.
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 250),
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF6366F1),
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // ── Info Card ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Container(
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
                '📡 NotificationListener catches scroll events bubbling up '
                'from any list below it — no ScrollController needed. '
                'Scroll down to hide the button, scroll up to bring it back.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Live event status panel ──────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFC7D2FE)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.bolt, size: 16, color: Color(0xFF6366F1)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _lastEvent,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── The scrollable list, wrapped in NotificationListener ─
          Expanded(
            child: NotificationListener<ScrollNotification>(
              // This fires for EVERY scroll-related notification that
              // bubbles up from the ListView below — start, update,
              // and end — without us attaching any ScrollController.
              onNotification: (notification) {
                // UserScrollNotification tells us the DIRECTION the
                // user is dragging — exactly what we need to show or
                // hide the FAB.
                if (notification is UserScrollNotification) {
                  if (notification.direction == ScrollDirection.reverse) {
                    // Reverse = user is scrolling DOWN the list.
                    setState(() {
                      _showFab = false;
                      _lastEvent = "UserScrollNotification → scrolling down";
                    });
                  } else if (notification.direction ==
                      ScrollDirection.forward) {
                    // Forward = user is scrolling UP the list.
                    setState(() {
                      _showFab = true;
                      _lastEvent = "UserScrollNotification → scrolling up";
                    });
                  }
                } else if (notification is ScrollEndNotification) {
                  setState(
                    () => _lastEvent = "ScrollEndNotification → stopped",
                  );
                }

                // Returning false lets the notification keep bubbling
                // up in case a parent widget also wants to see it.
                return false;
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: 25,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      "Item ${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
