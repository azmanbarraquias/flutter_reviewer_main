import 'package:flutter/material.dart';

import '../utils/utils.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        bottomNavigationBar: MyHomePage(),
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _index,
        onTap: (newIndex) {
          setState(() {
            _index = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Utils.getRandomIconData(),
                  color: _index == 0 ? Colors.blue : Colors.grey),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Utils.getRandomIconData(),
                  color: _index == 1 ? Colors.blue : Colors.grey),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Utils.getRandomIconData(),
                  color: _index == 2 ? Colors.blue : Colors.grey),
              label: ''),
        ]);
  }
}

