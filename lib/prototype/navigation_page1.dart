import 'package:flutter/material.dart';

import 'navigation_page2.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: MyPage1(),
    ),
  ));
}

class MyPage1 extends StatelessWidget {
  const MyPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: const Text("Click Me"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const MyPage2()));
          },
          trailing: const Hero(
            tag: 'safe',
            child: Icon(
              Icons.safety_check,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
