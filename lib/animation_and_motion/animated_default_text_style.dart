import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedDefaultTextStyle].

void main() => runApp(const AnimatedDefaultTextStyleExampleApp());

class AnimatedDefaultTextStyleExampleApp extends StatelessWidget {
  const AnimatedDefaultTextStyleExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedDefaultTextStyle Sample')),
        body: const AnimatedDefaultTextStyleExample(),
      ),
    );
  }
}

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({super.key});

  @override
  State<AnimatedDefaultTextStyleExample> createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool selected = false;
  late Color textColor;
  late double fontSize;

  @override
  void initState() {
    textColor = selected ? Colors.blueAccent : Colors.red;
    fontSize = selected ? 20 : 15;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
          duration: Durations.extralong1,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  textColor = selected ? Colors.blueAccent : Colors.red;
                  fontSize = selected ? 50 : 15;
                  selected = !selected;
                });
              },
              child: const Text('Flutter is fun'))),
    );
  }
}
