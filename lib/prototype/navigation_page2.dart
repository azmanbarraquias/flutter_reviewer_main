import 'package:flutter/material.dart';

class MyPage2 extends StatelessWidget {
  const MyPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Hero(
            tag: 'safe',
            child: Icon(
              Icons.safety_check,
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
