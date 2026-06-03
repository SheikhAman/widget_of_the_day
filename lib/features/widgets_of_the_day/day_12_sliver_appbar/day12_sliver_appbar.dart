import 'package:flutter/material.dart';

class Day12SliverAppBarWidget extends StatelessWidget {
  const Day12SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.indigo,
            expandedHeight: 220,
            pinned: true,
            stretch: true,
            iconTheme: const IconThemeData(color: Colors.white),

            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // CONTENT LIST
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Icon(Icons.image, color: Colors.white),
                      ),
                      title: Text("Item ${index+1}"),
                      subtitle: const Text("Sliver list item example"),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}