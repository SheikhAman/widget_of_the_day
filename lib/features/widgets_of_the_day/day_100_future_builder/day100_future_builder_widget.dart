import 'package:flutter/material.dart';

class Day100FutureBuilder extends StatefulWidget {
  const Day100FutureBuilder({super.key});

  @override
  State<Day100FutureBuilder> createState() => _Day100FutureBuilderState();
}

class _Day100FutureBuilderState extends State<Day100FutureBuilder> {
  late Future<String> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    // Uncomment to test error handling
    // throw Exception("Something went wrong");

    return "Data Loaded Successfully!";
  }

  void refreshData() {
    setState(() {
      futureData = fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 100 - FutureBuilder"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: futureData,
          builder: (context, snapshot) {
            // Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // Error State
            if (snapshot.hasError) {
              return Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(fontSize: 18),
              );
            }

            // Success State
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  snapshot.data ?? "No Data",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: refreshData,
                  child: const Text("Refresh Data"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}