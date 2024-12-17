// import 'package:flutter/material.dart';
// import 'package:tuple/tuple.dart';
//
// import '../utils/xprint.dart';


void main() {
  int min = 1;
  String textMin = 'minutes ago';


  if (min == 1 && textMin.contains('s')) {
    print('$min ${(textMin).replaceFirst(
        's', '')}');
  }
  else {
    print('${min} ${textMin}');
  }
}

// class MyPage extends StatelessWidget {
//   const MyPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: TextButton(
//         onPressed: () {
//           // mainTest();
//           Future<String>.delayed(const Duration(seconds: 3,), () {
//             return 'Done';
//           }).whenComplete(() => xPrint('XDone'));
//
//           xPrint("value");
//
//         },
//         child: const Text("Run Code"),
//       ),
//     );
//   }
// }
//
// void mainTest() {
//   // var p1 = Person(name: "Azman");
//   // print(p1.age);
//
//   var record = (123, true);
//   // PrintX('${record.$1}: ${record.$2}');
//
//   const t = Tuple2<String, int>('a', 10);
//
//   // PrintX(t.item1); // prints 'a'
//   // PrintX(t.item2 as String?); // pri
//
//   const t1 = Tuple2<String, int>('a', 10);
//   final t2 = t1.withItem1('a');
//   xPrint(t2.item2 as String?); // p
// }
//
// double addNumber(a, b) => a + b;
//
// class Person {
//   String? name;
//   int? age;
//
//   Person({this.name, this.age});
// }
//
// class Test {
//   void add1(a, b) {
//     // a & b are positional parameters
//     xPrint(
//         a + b); // print() is a built-in function that will be explained later
//   }
//
//   void add2(var a, {required int b, int c = 5}) {
//     // a & b are named parameters (because of the curly braces)
//     xPrint(a + b + c);
//     xPrint('End');
//   }
//
//   void add3(a, [b = 5]) {
//     // b is optional, 5 will be used as a default value
//     xPrint(a + b);
//   }
//
//   int add123({a, b, c = 100}) {
//     return a + b + c;
//   }
// }
//
// class Vehicle {
//   String? make;
//   String? model;
//
//   void moveForward(int meters) {
//   }
// }