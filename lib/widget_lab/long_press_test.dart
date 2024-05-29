import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String action = "START";
  Timer? timer;
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(action),
              SizedBox(height: 50),
              Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 20,
                child: GestureDetector(
                  onTap: () => setState(() {
                    action = "Tap";
                    number++;
                  }),
                  onLongPress: () => setState(() {
                    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
                      setState(() {
                        action = "Longpress started";
                        number++;
                      });
                    });
                  }),
                  onLongPressEnd: (_) => setState(() {
                    action = "Longpress stopped";
                    timer?.cancel();
                  }),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(20)
                      ),
                      width: 100,
                      height: 100,
                      child: Text('Tap')
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Text(number.toString())
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}