import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

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

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Visibility(
            visible: _loading,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      setState(() {
                        _loading = false;
                      });
                      final uri = Uri.parse('https://www.google.com/');
                      final myFuture = http.get(uri);
                      myFuture.then((response) {
                        xPrint(response.statusCode);
                        if (response.statusCode == 200) {
                          setState(() => _loading = true);
                        }
                      }).catchError((e) {
                        xPrint(e);
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text('An error occurred!'),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Message:'),
                                      const Gap(5),
                                      Text(
                                        '$e',
                                        style: const TextStyle(
                                            color: Colors.redAccent),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        child: const Text('Close'))
                                  ],
                                )).then((_){
                          setState(() => _loading = true);
                        });
                      });
                    },
                    child: const Text('Click Me')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
