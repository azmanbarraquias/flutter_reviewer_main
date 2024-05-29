import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contollers/tap_getx_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapGetXController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            GetBuilder<TapGetXController>(
              builder: (_) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Center(
                      child: Text(
                    'Tap ${controller.x}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  )),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Center(
                  child: Text(
                'Tap ${controller.x}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              )),
            ),
            GetBuilder<TapGetXController>(
              builder: (_) {
                return GestureDetector(
                  onTap: () {
                    controller.decreaseX();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Center(
                        child: Text(
                      'Tap ${controller.x}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
