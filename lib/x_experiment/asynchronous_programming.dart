import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';
import 'package:get/get.dart';

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

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    xPrint('MyPage Rebuild');
    RxInt rxCount = 0.obs;
    RxBool isProcessing = false.obs;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() {
                  xPrint('Count Rebuild');
                  return Text(
                    isProcessing.value
                        ? 'Please Wait'
                        : 'Count: ${rxCount.value}',
                    textAlign: TextAlign.center,
                  );
                }),
                OutlinedButton(
                    onPressed: () => futureIncrement(rxCount, isProcessing),
                    child: const Text('Press')),
                OutlinedButton(
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(
                            (BuildContext context) {
                          return Container(
                            height: 200,
                            color: Colors.amber,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('BottomSheet'),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('BottomSheet')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> futureIncrement(RxInt count, RxBool isProcessing) async {
    if (isProcessing.value == true) return;
    isProcessing.value = true;
    await Future.delayed(const Duration(seconds: 5), () {
      return count.value++;
    }).whenComplete(() {
      isProcessing.value = false;
      xPrint('Done');
    });
    xPrint('Process');
  }

  void bottomSheet(ctx) {
    // showModalBottomSheet(
    //    context: context,
    //    isDismissible: true,
    //    builder: (ctx) {
    //      return const Placeholder();
    //    }).then((_){
    //      xPrint("FSDSDSD");
    // });

    Scaffold.of(ctx).showBottomSheet((BuildContext context) {
      return Container(
          height: 300,
          child: const Placeholder());
    });
  }
}
