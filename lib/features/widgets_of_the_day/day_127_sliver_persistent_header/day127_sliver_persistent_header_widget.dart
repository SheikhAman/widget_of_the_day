import 'package:flutter/material.dart';

// ── Custom sticky header delegate ───────────────────────────────────
//
// SliverPersistentHeader needs a "delegate" that tells it 3 things:
//   1. maxExtent → how tall the header is when fully expanded
//   2. minExtent → how tall it shrinks to once pinned at the top
//   3. build()   → what to actually draw, given how far it has shrunk
class _ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 220;

  @override
  double get minExtent => 70;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // shrinkOffset goes from 0 (fully expanded) to maxExtent-minExtent
    // (fully collapsed). We turn that into a 0.0 → 1.0 "progress" value.
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    // As progress increases: avatar shrinks and name gets smaller.
    final avatarSize = 70 - (30 * progress); // 70 → 40
    final nameSize = 20 - (4 * progress); // 20 → 16

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: avatarSize / 2,
            backgroundColor: const Color(0xFF6366F1),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              "Sadik Hasan",
              style: TextStyle(fontSize: nameSize, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _ProfileHeaderDelegate oldDelegate) => false;
}

class Day127SliverPersistentHeader extends StatelessWidget {
  const Day127SliverPersistentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A normal, non-sliver AppBar — avoids conflicting with the
      // pinned SliverPersistentHeader below during initial layout.
      appBar: AppBar(title: const Text('Day 127 - SliverPersistentHeader')),
      body: CustomScrollView(
        slivers: [
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
                  '📌 Scroll down — the profile header below shrinks and '
                  'sticks to the top, just like Instagram or Twitter '
                  'profile pages.',
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

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // ── The sticky, shrinking header ──────────────────────────
          SliverPersistentHeader(
            pinned: true, // stays visible once it hits the top
            delegate: _ProfileHeaderDelegate(),
          ),

          // ── A normal list of posts below it ──────────────────────
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _postCard(index),
                ),
                childCount: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postCard(int index) {
    return Container(
      padding: const EdgeInsets.all(16),
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
              Icons.article_outlined,
              color: Color(0xFF6366F1),
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Text(
            "Post #${index + 1}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
