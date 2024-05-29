import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Transform.scale(
                    scaleX: 1,
                    child: const Text(
                      '10',
                      style: TextStyle(fontSize: 30, letterSpacing: -7),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: CupertinoApp(
              home: CupertinoPageScaffold(
                child: Center(
                  child: Text(
                    'ABC 123',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextViewLab extends StatelessWidget {
  const TextViewLab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
