import 'package:flutter/material.dart';

/// Day 156: NavigationDrawer (Material 3)
/// Real-world Example: Advanced App Navigation with Destinations
///
/// PROBLEM: The traditional 'Drawer' widget requires manual management of
/// ListTiles and selection states to look modern.
///
/// SOLUTION: NavigationDrawer is the official Material 3 widget for side
/// navigation. It uses 'NavigationDrawerDestination' and handles selection
/// logic and state-aware styling automatically.
class Day156NavigationDrawerWidget extends StatefulWidget {
  const Day156NavigationDrawerWidget({super.key});

  @override
  State<Day156NavigationDrawerWidget> createState() =>
      _Day156NavigationDrawerWidgetState();
}

class _Day156NavigationDrawerWidgetState
    extends State<Day156NavigationDrawerWidget> {
  // Track the selected index for navigation
  int _selectedIndex = 0;

  // Key for controlling the Scaffold state (to open drawer programmatically)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Day 156 - NavigationDrawer'),
        // Recruiter-impressive: Custom leading icon to trigger the drawer
        leading: IconButton(
          icon: const Icon(Icons.menu_open_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      // THE NAVIGATION DRAWER (Material 3)
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Close drawer after selection
          Navigator.pop(context);
        },
        children: [
          // Header section
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 32, 16, 10),
            child: Text(
              'Aman\'s Studio'.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const NavigationDrawerDestination(
            label: Text('Dashboard'),
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
          ),
          const NavigationDrawerDestination(
            label: Text('Messages'),
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
          ),
          const NavigationDrawerDestination(
            label: Text('Project Analytics'),
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          // Sub-header section
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text(
              'Management',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            label: Text('Settings'),
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
          ),
          const NavigationDrawerDestination(
            label: Text('Help & Support'),
            icon: Icon(Icons.help_outline),
            selectedIcon: Icon(Icons.help),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIconForIndex(_selectedIndex),
              size: 80,
              color: Colors.indigo.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 20),
            Text(
              'Active View: ${_getLabelForIndex(_selectedIndex)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'The NavigationDrawer handles destination selection, padding, and animations with native Material 3 logic.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.navigation),
              label: const Text('Explore Destinations'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.dashboard;
      case 1:
        return Icons.chat_bubble;
      case 2:
        return Icons.analytics;
      case 3:
        return Icons.settings;
      case 4:
        return Icons.help;
      default:
        return Icons.home;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Messages';
      case 2:
        return 'Analytics';
      case 3:
        return 'Settings';
      case 4:
        return 'Support';
      default:
        return 'Home';
    }
  }
}
