import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
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
    final mediaQuerySize = MediaQuery.of(context).size;
    final mediaQueryViewPadding = MediaQuery.of(context).viewPadding;
    final contextMediaQuery = context.mediaQuery;

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: mediaQuerySize.height - mediaQueryViewPadding.top,
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  //   final mediaQuerySize = MediaQuery.of(context).size;
                  // final mediaQueryViewPadding = MediaQuery.of(context).viewPadding;
                    TextItem(text: 'Device Height: ${mediaQuerySize.height.fix(2)}'),
                    TextItem(text: 'Device Width: ${mediaQuerySize.width.fix(2)}'),
                    TextItem(text: 'Device viewPadding Top: ${mediaQueryViewPadding.top.fix(2)}'),
                    TextItem(text: 'Device viewPadding Bottom: ${mediaQueryViewPadding.bottom.fix(2)}'),
                  ],
                ),
                const Divider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextItem(text: 'Get Height: ${Get.height.fix(2)}'),
                    TextItem(text: 'Get Width: ${Get.width.fix(2)}'),
                    // I think the statusbar height is pixel size. So, to convert it
                    // to logical pixel we have to divide it by device pixel ratio.
                    TextItem(text: 'Get statusBarHeight: ${(Get.statusBarHeight / contextMediaQuery.devicePixelRatio).fix(2)}'),
                    TextItem(text: 'Get bottomBarHeight: ${Get.bottomBarHeight.fix(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension FormatString on num {
  String fix(x) => toStringAsFixed(x);
}

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
