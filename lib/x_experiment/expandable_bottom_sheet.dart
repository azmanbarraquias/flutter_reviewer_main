import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                barrierColor: Colors.transparent,
                isDismissible: true,
                isScrollControlled: false,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    height: 700,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                  );
                });
          },
          child: const Text('Show'),
        ),
      ),
    );
  }
}
