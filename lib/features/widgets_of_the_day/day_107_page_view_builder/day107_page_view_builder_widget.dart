import 'package:flutter/material.dart';

class Day107PageViewBuilder extends StatefulWidget {
  const Day107PageViewBuilder({super.key});

  @override
  State<Day107PageViewBuilder> createState() => _Day107PageViewBuilderState();
}

class _Day107PageViewBuilderState extends State<Day107PageViewBuilder> {
  final PageController _controller = PageController();

  final List<Map<String, dynamic>> _pages = [
    {
      'color': Colors.orange,
      'icon': Icons.wb_sunny_outlined,
      'label': 'Morning',
    },
    {
      'color': Colors.purple,
      'icon': Icons.nights_stay_outlined,
      'label': 'Night',
    },
    {
      'color': Colors.redAccent,
      'icon': Icons.favorite_outline,
      'label': 'Passion',
    },
    {
      'color': Colors.teal,
      'icon': Icons.water_outlined,
      'label': 'Ocean',
    },
    {
      'color': Colors.blue,
      'icon': Icons.cloud_outlined,
      'label': 'Sky',
    },
    {
      'color': Colors.black,
      'icon': Icons.star_outline,
      'label': 'Space',
    },
  ];

  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 107 - PageView Builder'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ── PageView ────────────────────────────────────────────
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final page = _pages[index];
              final Color color = page['color'] as Color;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon
                    Icon(
                      page['icon'],
                      size: 60,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),

                    const SizedBox(height: 20),

                    // Page label
                    Text(
                      page['label'],
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Circle with page number
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 32,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Page count text
                    Text(
                      'Page ${index + 1} of ${_pages.length}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Swipe hint (only on first page)
                    if (index == 0)
                      Column(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white.withValues(alpha: 0.6),
                            size: 28,
                          ),
                          Text(
                            'Swipe up to explore',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),

          // ── Dot Indicator (right side) ───────────────────────────
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: 8,
                  height: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(4),
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