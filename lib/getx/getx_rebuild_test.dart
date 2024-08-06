import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/utils.dart';
import 'package:get/get.dart';

import '../utils/xprint.dart';

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

class MyPage extends GetView<StudentController> {
  const MyPage({super.key});

  @override
  StudentController get controller =>
      Get.findOrPut<StudentController>(StudentController());

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
        title: const Text("GetX Rebuild Test"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () {
                xPrint('Rebuild');
                return Container(
                color: controller.tap.value ? Colors.red : Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() =>
                        StudentInfo(title: '${controller.newName1}', age: 25)),
                    Obx(() =>
                        StudentInfo(title: '${controller.newName2}', age: 30)),
                  ],
                ),
              );
              },
            ),
            OutlinedButton(
                onPressed: () {
                  controller.newName1.value = 'Wayne';
                },
                child: const Text('Press Me 1')),
            OutlinedButton(
                onPressed: () {
                  controller.newName2.value = 'Christine';
                },
                child: const Text('Press Me 2')),
          ],
        ),
      ),
    );
  }
}

// class MyPage2 extends StatefulWidget {
//   const MyPage2({super.key});
//
//   @override
//   State<MyPage2> createState() => _MyPage2State();
// }
//
// class _MyPage2State extends State<MyPage2> {
//   var newName1 = 'Bob';
//   var newName2 = 'Gwen';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ))
//         ],
//         title: const Text("GetX Rebuild Test"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 StudentInfo(title: newName1, age: 25),
//                 StudentInfo(title: newName2, age: 30),
//               ],
//             ),
//             OutlinedButton(
//                 onPressed: () {
//                   setState(() => newName1 = 'Wayne');
//                 },
//                 child: const Text('Press Me 1')),
//             OutlinedButton(
//                 onPressed: () {
//                   setState(() => newName2 = 'Christine');
//                 },
//                 child: const Text('Press Me 2')),
//           ],
//         ),
//       ),
//     );
//   }
// }

class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key, required this.title, required this.age});

  final String title;
  final num age;

  @override
  Widget build(BuildContext context) {
    xPrint('StudentInfo Rebuild: $title');

    return Card(
      margin: const EdgeInsets.all(15),
      child: ListTile(title: Text(title), subtitle: Text('Age is $age')),
    );
  }
}

class StudentController extends GetxController
    with GetTickerProviderStateMixin {
  /// This both are the same
  RxString newName1 = 'Bob'.obs;
  final newName2 = 'May'.obs;

  RxBool tap = false.obs;

  // initial value is recommended, but not mandatory
  final name = RxString('');
  final isLogged = RxBool(false);
  final count = RxInt(0);
  final balance = RxDouble(0.0);
  final items = RxList<String>([]);
  final myMap = RxMap<String, int>({});
  final num = RxNum(0);
  final controller = Rx<Subject>(Subject('Math'));

  final nameR = Rx<String>('');
  final itemsR = Rx<List<String>>([]);
  final myMapR = Rx<Map<String, int>>({});

// Custom classes - it can be any class, literally
  final user = Rx<Subject>(Subject('English'));

  final nameO = ''.obs;
  final isLoggedO = false.obs;
  final countO = 0.obs;
  final balanceO = 0.0.obs;
  final numberO = 0.obs;
  final itemsO = <String>[].obs;
  final myMapO = <String, int>{}.obs;

// Custom classes - it can be any class, literally
  final userO = Subject('').obs;
}

class Subject {
  final String bookName;

  Subject(this.bookName);
}
