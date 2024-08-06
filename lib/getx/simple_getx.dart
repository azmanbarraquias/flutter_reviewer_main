import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => Controller());
  runApp(MyApp());
}

class Controller extends GetxController {
  // Define an observable variable
  var count = 0.obs; // ".obs" makes it observable

  // Increase the count
  void increaseCount() {
    count++;
  }

  void increaseCount2() {
    count++;
    // update();
  }


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final Controller controller = Get.find<Controller>();
    xPrint('MyApp rebuild');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Obx Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the current count using Obx
              // Obx(() {
              //   xPrint('Count rebuild 1');
              //   return Text('Count: ${controller.count}');
              // }),

              GetBuilder<Controller>(
                // specify type as Controller
                init: Controller(), //initialize with the Controller
                builder: (value) {
                  xPrint('Count rebuild 2');
                  return Text(
                    '${value.count}', // value is an instance of Controller.
                  );
                },
              ),

              GetBuilder<Controller>(
                // no need to initialize Controller ever again, just mention the type
                builder: (value) {
                  xPrint('Count rebuild 3');
                  return Text(
                    '${value.count}', // counter is updated when increment() is called
                  );
                },
              ),

              // Button to increase the count

              GetBuilder<Controller>(
                // no need to initialize Controller ever again, just mention the type
                builder: (value) {
                  xPrint('Count rebuild 4');
                  return Text(
                    '${value.count}', // counter is updated when increment() is called
                  );
                },
              ),

              GetBuilder<Controller>(
                // no need to initialize Controller ever again, just mention the type
                builder: (value) {
                  xPrint('Count rebuild 5');
                  return ElevatedButton(
                    onPressed: () {
                      value.increaseCount2();
                    },
                    child: Text('Increase Count 2'),
                  );
                },
              ),



              GetX<Controller>(
                builder: (controller) {
                  print("count 1 rebuild");
                  return Text('${controller.count}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
