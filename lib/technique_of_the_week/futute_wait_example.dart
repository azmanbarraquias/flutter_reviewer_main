
import 'package:flutter/material.dart';

// Future.wait (Technique of the Week)
// https://youtu.be/SYy8_z-qsRo?feature=shared
// https://api.flutter.dev/flutter/dart-async/Future/wait.html

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
