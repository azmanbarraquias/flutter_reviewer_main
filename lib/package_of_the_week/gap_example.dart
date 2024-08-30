import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gap Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

/// A widget.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage].
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap.expand(20, color: Colors.yellow),
            Gap(20),
            Gap.expand(20, color: Colors.red),
            MaxGap(2000),
            Gap.expand(20, color: Colors.red),
            Row(
              children: [
                Gap(20, color: Colors.green, crossAxisExtent: 20),
                Gap(50),
                Gap(20, color: Colors.green, crossAxisExtent: 20),
              ],
            ),
            Gap.expand(200, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
