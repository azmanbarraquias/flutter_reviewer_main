import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
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

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          top: true,
          child: Container(
            height: 20000,
            decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                )),
          ),
        ),
      ),
    );
  }
}
