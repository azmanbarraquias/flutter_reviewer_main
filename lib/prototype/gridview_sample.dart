import 'package:flutter/material.dart';

import '../utils/utils.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SafeArea(child: HomePage()),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GridViewSample(),
    );
  }
}

class GridViewSample extends StatelessWidget {
  const GridViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(10) //                 <--- border radius here
            ),
      ),
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 8 : 4,
        children: List.generate(10, (index) => index.toString())
            .map((e) => CircleAvatar(child: Utils.getRandomIcon()))
            .toList(),
      ),
    );
  }
}
