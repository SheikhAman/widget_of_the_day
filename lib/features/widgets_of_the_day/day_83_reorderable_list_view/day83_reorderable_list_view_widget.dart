import 'package:flutter/material.dart';
import 'data/users.dart';
import 'model/user.dart';

class Day83ReorderableListViewWidget extends StatefulWidget {
  const Day83ReorderableListViewWidget({super.key});

  @override
  State<Day83ReorderableListViewWidget> createState() =>
      _Day83ReorderableListViewWidgetState();
}

class _Day83ReorderableListViewWidgetState
    extends State<Day83ReorderableListViewWidget> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 83 - ReorderableListView'),
      ),
      body: ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: users.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final user = users.removeAt(oldIndex);
            users.insert(newIndex, user);
          });
        },
        itemBuilder: (context, index) {
          final user = users[index];
          return buildUserCard(user, index);
        },
      ),
    );
  }

  Widget buildUserCard(User user, int index) {
    return Card(
      key: ValueKey(user.urlImage), // better unique key
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(user.urlImage),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Drag to reorder"),
        trailing: const Icon(Icons.drag_handle),
      ),
    );
  }
}