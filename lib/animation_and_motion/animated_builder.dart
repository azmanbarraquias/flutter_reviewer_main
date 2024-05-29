import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedBuilder].

void main() => runApp(const AnimatedBuilderExampleApp());

class AnimatedBuilderExampleApp extends StatefulWidget {
  const AnimatedBuilderExampleApp({super.key});

  @override
  State<AnimatedBuilderExampleApp> createState() => _AnimatedBuilderExampleAppState();
}

class _AnimatedBuilderExampleAppState extends State<AnimatedBuilderExampleApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: AnimatedBuilderExample()),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  late final animation = Tween(begin: 0, end: 2 * math.pi).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: const SizedBox(
          width: 200.0,
          height: 200.0,
          child: FittedBox(fit: BoxFit.fill, child: FlutterLogo()),
        ),
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: animation.value.toDouble(),
            child: child,
          );
        },
      ),
    );
  }
}
