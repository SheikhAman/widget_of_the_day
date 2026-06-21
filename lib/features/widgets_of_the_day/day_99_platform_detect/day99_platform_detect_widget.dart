import 'dart:io';
import 'package:flutter/material.dart';

class Day99PlatformDetect extends StatelessWidget {
  const Day99PlatformDetect({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isAndroid = Platform.isAndroid;
    final bool isIOS = Platform.isIOS;
    final bool isWindows = Platform.isWindows;
    final bool isMacOS = Platform.isMacOS;
    final bool isLinux = Platform.isLinux;

    String currentPlatform = "Unknown";

    if (isAndroid) {
      currentPlatform = "Android";
    } else if (isIOS) {
      currentPlatform = "iOS";
    } else if (isWindows) {
      currentPlatform = "Windows";
    } else if (isMacOS) {
      currentPlatform = "macOS";
    } else if (isLinux) {
      currentPlatform = "Linux";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 99 - Platform Detection"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.devices,
                  size: 80,
                ),
                const SizedBox(height: 20),

                Text(
                  "Current Platform",
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: 10),

                Text(
                  currentPlatform,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Text("Android: $isAndroid"),
                Text("iOS: $isIOS"),
                Text("Windows: $isWindows"),
                Text("macOS: $isMacOS"),
                Text("Linux: $isLinux"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}