import 'package:flutter/material.dart';

class Day126SliverListAndSliverGrid extends StatelessWidget {
  const Day126SliverListAndSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      body: CustomScrollView(
        // CustomScrollView lets multiple "slivers" (scrollable pieces)
        // share ONE smooth scroll — instead of nesting a GridView inside
        // a ListView, which fights over who controls scrolling.
        slivers: [
          SliverAppBar(
            title: const Text('Day 126 - SliverList & SliverGrid'),
            centerTitle: true,
            floating: true, // reappears as soon as you scroll up a bit
          ),

          // ── Info Card ──────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            sliver: SliverToBoxAdapter(
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
                  '📜 SliverGrid and SliverList can live inside the same '
                  'CustomScrollView — scrolling through both feels like '
                  'one continuous list, even though they lay out differently.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),

          // ── Section Title: Categories ────────────────────────────
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Categories (SliverGrid)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),

          // ── SliverGrid: a 2-column grid of category cards ────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.4,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _categoryCard(index),
                childCount: 4,
              ),
            ),
          ),

          // ── Section Title: Items ─────────────────────────────────
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(24, 28, 24, 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                "All Items (SliverList)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),

          // ── SliverList: a plain vertical list of item rows ───────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _itemRow(index),
                ),
                childCount: 10,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _categoryCard(int index) {
    final icons = [
      Icons.shopping_bag_outlined,
      Icons.fastfood_outlined,
      Icons.directions_car_outlined,
      Icons.spa_outlined,
    ];
    final labels = ["Shopping", "Food", "Travel", "Wellness"];

    return Container(
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
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons[index], color: const Color(0xFF6366F1), size: 26),
          const SizedBox(height: 8),
          Text(
            labels[index],
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _itemRow(int index) {
    return Container(
      padding: const EdgeInsets.all(14),
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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF6366F1),
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Text(
            "Item ${index + 1}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
