import 'package:flutter/material.dart';

import 'tabs/home_tab.dart';
import 'tabs/settings_tab.dart';
import 'tabs/profile_tab.dart';

class Day13TabBarWidget extends StatelessWidget {
  const Day13TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Day 13 - TabBar"),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            HomeTab(),
            SettingsTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}