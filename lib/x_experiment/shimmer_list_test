import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

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
        child: Column(
          children: [
            shimmerLing(),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.yellow[100],
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          100,
                          (index) {
                            return shimmerLing();
                          },
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }

  shimmerLing() {
    return Shimmer(
      // This is the ONLY required parameter
      // This is NOT the default value. Default value: Duration(seconds: 0)
      // This is the default value
      color: Colors.white,
      // This is the default value
      colorOpacity: 0.3,
      // This is the default value
      enabled: true,
      // This is the default value
      direction: const ShimmerDirection.fromLTRB(),
      // This is the ONLY required parameter
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
