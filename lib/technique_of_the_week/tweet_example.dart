import 'package:flutter/material.dart';

// Tween (Technique of the Week)
// https://youtu.be/fatb7Clc0MM?feature=shared
// https://api.flutter.dev/flutter/animation/Tween-class.html

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
