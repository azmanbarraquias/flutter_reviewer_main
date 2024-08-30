import 'package:flutter/material.dart';

//List.generate (Technique of the Week)
// https://youtu.be/izr7uBuiacE?feature=shared
// https://api.flutter.dev/flutter/dart-core/List/List.generate.html
// https://docs.flutter.dev/cookbook/lists/mixed-list

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
