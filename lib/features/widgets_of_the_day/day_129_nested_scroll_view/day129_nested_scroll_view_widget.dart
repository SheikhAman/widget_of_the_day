import 'package:flutter/material.dart';

// ── Pins the TabBar to the top once the header scrolls away ─────────
//
// Just like Day 127's SliverPersistentHeader, this delegate tells the
// sliver system exactly how tall the TabBar is (its min AND max extent
// are the same — a TabBar doesn't shrink, it just sticks in place).
class _PinnedTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _PinnedTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Material gives it a solid white background so list content
    // doesn't show through underneath while it's pinned.
    return Material(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant _PinnedTabBarDelegate oldDelegate) => false;
}

class Day129NestedScrollView extends StatefulWidget {
  const Day129NestedScrollView({super.key});

  @override
  State<Day129NestedScrollView> createState() => _Day129NestedScrollViewState();
}

class _Day129NestedScrollViewState extends State<Day129NestedScrollView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(title: const Text('Day 129 - NestedScrollView')),
      // NestedScrollView has TWO scroll areas working together:
      //  - The OUTER scroll = everything in headerSliverBuilder
      //    (profile info + tab bar) — this scrolls away first.
      //  - The INNER scroll = whatever list is inside the active tab
      //    (body) — this takes over scrolling once the header is gone.
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // ── Info Card ──────────────────────────────────────
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
                    '👤 Scroll the list — the profile card scrolls away '
                    'first (outer scroll), then the tab bar sticks and '
                    'the list underneath takes over (inner scroll).',
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

            // ── Profile Header (part of the OUTER scroll) ───────
            SliverToBoxAdapter(child: _profileHeader()),

            // ── Pinned Tab Bar ───────────────────────────────────
            SliverPersistentHeader(
              pinned: true,
              delegate: _PinnedTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: const Color(0xFF6366F1),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xFF6366F1),
                  tabs: const [
                    Tab(text: "Posts"),
                    Tab(text: "Saved"),
                  ],
                ),
              ),
            ),
          ];
        },
        // ── The INNER scroll: each tab has its own scrollable list.
        body: TabBarView(
          controller: _tabController,
          children: [_postList("Post"), _postList("Saved Item")],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: Color(0xFF6366F1),
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sadik Hasan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 4),
                Text(
                  "Flutter Developer",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postList(String label) {
    // A plain ListView — NestedScrollView automatically links its
    // scrolling to the outer header without any extra setup here.
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: 12,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
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
                "$label ${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
