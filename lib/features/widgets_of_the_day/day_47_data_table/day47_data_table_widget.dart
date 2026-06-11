import 'package:flutter/material.dart';

class Day47DataTableWidget extends StatefulWidget {
  const Day47DataTableWidget({super.key});

  @override
  State<Day47DataTableWidget> createState() => _Day47DataTableWidgetState();
}

class _Day47DataTableWidgetState extends State<Day47DataTableWidget> {
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Day 47 - DataTable'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: width * 0.1,
            sortColumnIndex: 0,
            sortAscending: isAscending,
            columns: [
              DataColumn(
                label: const Text("First Name"),
                onSort: (index, _) {
                  setState(() {
                    isAscending = !isAscending;

                    names.sort((a, b) => isAscending
                        ? a.firstName.compareTo(b.firstName)
                        : b.firstName.compareTo(a.firstName));
                  });
                },
              ),
              const DataColumn(label: Text("Last Name")),
              const DataColumn(label: Text("Age")),
            ],
            rows: names.map((user) {
              return DataRow(
                cells: [
                  DataCell(Text(user.firstName)),
                  DataCell(Text(user.lastName)),
                  DataCell(Text(user.age.toString())),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

/// ---------------- MODEL ----------------
class Name {
  final String firstName;
  final String lastName;
  final int age;

  Name({
    required this.firstName,
    required this.lastName,
    required this.age,
  });
}

/// ---------------- SAMPLE DATA ----------------
List<Name> names = [
  Name(firstName: "Murshed", lastName: "Islam", age: 27),
  Name(firstName: "Ibn", lastName: "Sina", age: 27),
  Name(firstName: "Amil", lastName: "Hossain", age: 28),
  Name(firstName: "Sabbir", lastName: "Ali", age: 20),
  Name(firstName: "Kamal", lastName: "Hossain", age: 31),
];