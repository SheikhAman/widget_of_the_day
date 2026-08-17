import 'package:flutter/material.dart';

/// Day 158: NavigationBar (Material 3)
/// Real-world Example: Modern Social Media or E-commerce App Shell
///
/// PROBLEM: Legacy 'BottomNavigationBar' uses older Material 2 specs,
/// making it difficult to achieve the modern, rounded selection look
/// seen in the latest Android system apps.
///
/// SOLUTION: NavigationBar is the official Material 3 component for bottom
/// navigation. It provides a standardized height, refined animations,
/// and state-aware 'NavigationDestination' items out of the box.
class Day158NavigationBarWidget extends StatefulWidget {
  const Day158NavigationBarWidget({super.key});

  @override
  State<Day158NavigationBarWidget> createState() =>
      _Day158NavigationBarWidgetState();
}

class _Day158NavigationBarWidgetState extends State<Day158NavigationBarWidget> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Day 158 - NavigationBar')),
      // THE NAVIGATION BAR (Material 3)
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        indicatorColor: Colors.indigo.withValues(alpha: 0.15),
        selectedIndex: _currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.indigo),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore, color: Colors.indigo),
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('3'),
              child: Icon(Icons.notifications, color: Colors.indigo),
            ),
            icon: Badge(
              label: Text('3'),
              child: Icon(Icons.notifications_outlined),
            ),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.indigo),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        _buildPage(
          icon: Icons.home,
          title: 'Welcome Home',
          description: 'Explore the latest widgets and modern M3 patterns.',
        ),

        /// Explore page
        _buildPage(
          icon: Icons.explore,
          title: 'Discover New Widgets',
          description:
              'Browse through the growing collection of 150+ components.',
        ),

        /// Notifications page
        _buildPage(
          icon: Icons.notifications,
          title: 'Recent Updates',
          description: 'You have 3 new widget examples ready for review.',
        ),

        /// Profile page
        _buildPage(
          icon: Icons.person,
          title: 'Developer Profile',
          description: 'Day 158 of the Widget of the Day challenge.',
        ),
      ][_currentPageIndex],
    );
  }

  Widget _buildPage({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(icon, size: 64, color: Colors.indigo),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey.shade600, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
