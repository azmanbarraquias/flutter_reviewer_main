import 'package:flutter/material.dart';

// Isolates (Technique of the Week)
// https://youtu.be/PPwJ75vqP_s?feature=shared
// https://docs.flutter.dev/perf/isolates
// https://medium.com/dartlang/better-isolate-management-with-isolate-run-547ef3d6459b

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // Start Here
          child: const Placeholder(),
        ),
      ),
    );
  }
}
