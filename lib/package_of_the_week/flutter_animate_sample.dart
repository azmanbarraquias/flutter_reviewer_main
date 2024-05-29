
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
  double enableAnimate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    enableAnimate = 1;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
          title: const Text('Title'),
          backgroundColor: Theme.of(context).primaryColor),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    enableAnimate = !(enableAnimate == 1) ? 1 : 0;

                  });
                },
                child: const Text('Buttons'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Buttons'),
              )
                  .animate(target: enableAnimate == 1 ? 1 : 0)
                  .slideY(curve: Curves.easeIn),
            ],
          ),
          // Start Here
        ),
      ),
    );
  }
}
