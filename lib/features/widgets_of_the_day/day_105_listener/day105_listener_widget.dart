import 'package:flutter/material.dart';

class Day105Listener extends StatefulWidget {
  const Day105Listener({super.key});

  @override
  State<Day105Listener> createState() => _Day105ListenerState();
}

class _Day105ListenerState extends State<Day105Listener> {
  int _downCount = 0;
  int _upCount = 0;
  Offset _position = Offset.zero;
  bool _isPressed = false;
  bool _hasInteracted = false;
  bool _isInside = false;

  void _updatePosition(PointerEvent event) {
    setState(() {
      _position = event.localPosition;
      _hasInteracted = true;
    });
  }

  void _handleDown(PointerDownEvent event) {
    setState(() {
      _downCount++;
      _isPressed = true;
      _position = event.localPosition;
      _hasInteracted = true;
    });
  }

  void _handleUp(PointerUpEvent event) {
    setState(() {
      _upCount++;
      _isPressed = false;
      _position = event.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double pointerSize = 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 105 - Listener"),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 350,
            maxHeight: 350,
          ),
          child: MouseRegion(
            // Hide dot when cursor leaves the box
            onEnter: (_) => setState(() => _isInside = true),
            onExit: (_) => setState(() => _isInside = false),
            child: Listener(
              onPointerDown: _handleDown,
              onPointerUp: _handleUp,
              onPointerMove: _updatePosition,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Pointer Event Tracker",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Presses: $_downCount\nReleases: $_upCount",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Position:\n(${_position.dx.toStringAsFixed(1)}, "
                              "${_position.dy.toStringAsFixed(1)})",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Pointer dot — only shown when inside the box
                  if (_hasInteracted && _isInside)
                    Positioned(
                      left: _position.dx - pointerSize / 2,
                      top: _position.dy - pointerSize / 2,
                      child: IgnorePointer(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: _isPressed ? pointerSize * 1.5 : pointerSize,
                          height: _isPressed ? pointerSize * 1.5 : pointerSize,
                          decoration: BoxDecoration(
                            color: _isPressed
                                ? Colors.purple.withValues(alpha: 0.6)
                                : Colors.purple.withValues(alpha:0.4),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple.shade700,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}