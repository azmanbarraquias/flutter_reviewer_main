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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Stack(children: <Widget>[

                    Positioned(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 52,
                        child: TextField(),
                        decoration: const BoxDecoration(color: Colors.pink),
                      ),
                    ),
                  ]);
                });
          },
          child: const Text('Show'),
        ),
      ),
    );
  }
}
