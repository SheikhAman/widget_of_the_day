import 'dart:ui';
import 'package:flutter/material.dart';

/// DAY 82 — BackdropFilter (Frosted Glass)
///
/// The recipe is always:
///   Stack
///    ├── background image        ← what gets blurred
///    └── BackdropFilter          ← does the blurring
///         └── Container(transparent) ← your card on top

class Day82BackdropFilterWidget extends StatelessWidget {
  const Day82BackdropFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 82 · BackdropFilter'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      extendBodyBehindAppBar: true, // image goes behind the AppBar
      body: Stack(
        fit: StackFit.expand,
        children: [

          // ── 1. BACKGROUND ──────────────────────────────
          Image.network(
            'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800',
            fit: BoxFit.cover,
          ),

          // ── 2. FROSTED GLASS CARD ──────────────────────
          // ClipRRect gives the blur rounded corners
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                // sigmaX/Y = how much blur. 20 = very frosted
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),

                // Container must be transparent so blur shows through
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(24),
                  color: Colors.white.withValues(alpha: 0.2),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.ac_unit, size: 48, color: Colors.white),
                      SizedBox(height: 12),
                      Text(
                        'Frosted Glass',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'BackdropFilter blurs everything behind this card.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
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