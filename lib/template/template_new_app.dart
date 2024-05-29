
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.yellow,
        brightness: Brightness.light,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(),
      ),
      home: const MyPage(),
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
          title: const Text('Title'),
          backgroundColor: Theme.of(context).primaryColor),
      body: SafeArea(
        child: Container(
        // Start Here
          decoration: const BoxDecoration(),
          child: const Placeholder(),
        ),
      ),
    );
  }
}
