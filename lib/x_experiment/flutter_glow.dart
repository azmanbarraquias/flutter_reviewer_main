import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

const flutterColor = Color.fromRGBO(172, 97, 185, 1);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkboxSelected = false;
  bool switchSelected = false;
  bool radioSelected = false;
  bool iconSelected = false;

  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GlowButton(
              spreadRadius: 5,
              onPressed: () {},
              color: flutterColor,
              child: const Text('Glow'),
            ),
            const SizedBox(height: 32),
            GlowCheckbox(
              value: checkboxSelected,
              enable: true,
              color: flutterColor,
              onChange: (bool value) {
                setState(() {
                  checkboxSelected = !checkboxSelected;
                });
              },
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                setState(() {
                  iconSelected = !iconSelected;
                });
              },
              child: GlowIcon(
                iconSelected ? Icons.wb_cloudy : Icons.cloud_queue,
                color: flutterColor,
                glowColor: iconSelected ? flutterColor : Colors.transparent,
                size: 64,
                blurRadius: 5,
              ),
            ),
            const SizedBox(height: 32),
            const GlowText(
              'Glow Text',
              style: TextStyle(fontSize: 40, color: flutterColor),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlowRadio<bool>(
                  value: true,
                  groupValue: radioSelected,
                  color: flutterColor,
                  onChange: (value) {
                    setState(() {
                      radioSelected = value;
                      log(value.toString());
                    });
                  },
                ),
                const SizedBox(width: 32),
                GlowRadio<bool>(
                  value: false,
                  color: flutterColor,
                  groupValue: radioSelected,
                  onChange: (value) {
                    setState(() {
                      radioSelected = value;
                      log(value.toString());
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            GlowSwitch(
              onChanged: (value) {
                setState(() {
                  switchSelected = value;
                });
              },
              value: switchSelected,
              activeColor: flutterColor.withOpacity(0.6),
              blurRadius: 4,
            ),
            const SizedBox(height: 32),
            const GlowLineProgress(
              blurRadius: 12,
              glowColor: flutterColor,
            )
          ],
        ),
      ),
    );
  }
}
