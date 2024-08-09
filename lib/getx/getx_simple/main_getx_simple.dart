import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';
import 'package:get/get.dart';
import 'getx_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.lazyPut(() => GetXController());

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends GetView<GetXController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    xPrint('Rebuild MyPage');
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Obx(
            () => GestureDetector(
              onTap: () {
                controller.countObs++;
              },
              child: title(),
            ),
          ),
        ),
      ),
    );
  }

  widgetCustomButton({required String text, required Function()? onTap}) {
    xPrint('Rebuild CustomButton');
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(context) {
    GetXController controller = Get.find();
    xPrint('build Title');
    return Text('Count ${controller.countObs.value}');
  }
}

Widget title() {
  GetXController controller = Get.find();
  xPrint('build Title');
  return Text('Count ${controller.countObs.value}');
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    xPrint('Rebuild CustomButton');
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
