import 'package:flutter/material.dart';

// Completers (Technique of the Week)
// https://api.flutter.dev/flutter/dart-async/Completer-class.html
// https://youtu.be/N8sBC_eK7Z4?si=iqcyK6WsnLlDjOo6

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
