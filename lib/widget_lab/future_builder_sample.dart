import 'dart:async';

import 'package:flutter/material.dart';

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

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'MyPage';

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: start(),
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (!(snapshot.connectionState == ConnectionState.done)) {
              const CircularProgressIndicator();
            }
            else {
              return const FlutterLogo() ;
            }
            return const Placeholder();
          },
        ),
      ),
    );
  }
}


Future<void> start() async {
  foo();
}

void foo() {
  Future.delayed(const Duration(seconds: 30), () async {
    // do something here
    await Future.delayed(const Duration(seconds: 30));
    // do stuff
  });
}