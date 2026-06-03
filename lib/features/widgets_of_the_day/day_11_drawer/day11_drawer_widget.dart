import 'package:flutter/material.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_11_drawer/first_page.dart';
import 'package:widget_of_the_day/features/widgets_of_the_day/day_11_drawer/second_page.dart';


class Day11DrawerWidget extends StatelessWidget {
  const Day11DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Day 11 - Drawer"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),

      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [

              // HEADER
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.indigo),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "UI Portfolio App",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              _drawerItem(
                context,
                icon: Icons.home,
                title: "First Page",
                page: const FirstPage(),
              ),

              _drawerItem(
                context,
                icon: Icons.person,
                title: "Second Page",
                page: const SecondPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required Widget page,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // close drawer first
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
    );
  }
}