import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/message_page.dart';
import 'pages/settings_page.dart';
import 'pages/account_page.dart';

class Day09BottomNavBarWidget extends StatefulWidget {
  const Day09BottomNavBarWidget({super.key});

  @override
  State<Day09BottomNavBarWidget> createState() => _Day09BottomNavBarWidgetState();
}

class _Day09BottomNavBarWidgetState extends State<Day09BottomNavBarWidget> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    MessagePage(),
    SettingsPage(),
    AccountPage(),
  ];

  void onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 09 - Bottom Nav"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabChanged,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}