import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';

import '../utils/xprint.dart';

void main() {
  runApp(const BetterFeedback(child: MyApp()));
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

  final title = 'Feedback';

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
              onPressed: showFeedback,
              icon: const Icon(
                Icons.feedback,
                color: Colors.black,
              ))
        ],
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.grey,
            height: 300,
            width: 200,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlutterLogo(
                  size: 110,
                ),
                Text(
                  'Feedback',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showFeedback() async {
    xPrint('Working');
    BetterFeedback.of(context).show((userFeedback) async {
      // Do something with the feedback
      xPrint('FeedBackShow');
      // final screenShot = userFeedback.screenshot;
    });
  }
}
