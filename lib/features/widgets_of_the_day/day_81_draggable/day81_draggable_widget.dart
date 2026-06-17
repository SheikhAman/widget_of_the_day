import 'package:flutter/material.dart';

class Day81DraggableWidget extends StatefulWidget {
  const Day81DraggableWidget({super.key});

  @override
  State<Day81DraggableWidget> createState() => _Day81DraggableWidgetState();
}

class _Day81DraggableWidgetState extends State<Day81DraggableWidget> {
  Color _boxColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 81 — Draggable')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // ── STEP 1: DROP ZONE ──────────────────
              // Accepts the Color and repaints the box
              DragTarget<Color>(
                onAcceptWithDetails: (details) {
                  setState(() => _boxColor = details.data);
                },
                builder: (context, _, __) => Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: _boxColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Drop here',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              // ── STEP 2: DRAGGABLE ──────────────────
              // Carries Color(green) to any DragTarget
              Draggable<Color>(
                data: Colors.green,
                feedback: Container(         // floats under finger
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                childWhenDragging: Container( // stays in place, faded
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Container(            // shown at rest
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Drag me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}