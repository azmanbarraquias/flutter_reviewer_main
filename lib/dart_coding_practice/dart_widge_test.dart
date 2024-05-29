import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static var runTime = 0;

  @override
  Widget build(BuildContext context) {
    runTime++;
    // Code Here
    mainDartWidget();
    print('');
    print('${runTime.runtimeType} $runTime');
    return const Placeholder();
  }
}

void mainDartWidget(){
 List<int> test = [1, 2 ,3];
 print(test[0]);
}
