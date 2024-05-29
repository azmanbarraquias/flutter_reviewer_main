import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
            context: context,
            bodyBuilder: (ctx) => const MenuItems(),
            width: 250,
            height: 150);
      },
      child: const Text("Test"),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          color: Colors.red,
          child: const Text("Menu 1"),
        ),
        Container(
          height: 50,
          color: Colors.green,
          child: const Text("Menu 2"),
        ),
        Container(
          height: 50,
          color: Colors.blue,
          child: const Text("Menu 3"),
        ),
      ],
    );
  }
}
