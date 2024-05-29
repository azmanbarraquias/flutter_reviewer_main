
import 'package:flutter/material.dart';

enum Light { on, off, auto }

void main() {
  String? nonNullableVariable; // Non-nullable variable
  nonNullableVariable = null;
  var asd = Text(nonNullableVariable!);
  print(asd.data);
}

void asd () {
  final fixedLengthList = List<int>.filled(5, 0); // Creates fixed-length list.
  print(fixedLengthList); // [0, 0, 0, 0, 0]
  fixedLengthList[0] = 87;
  fixedLengthList.setAll(1, [1, 2, 3]);
  print(fixedLengthList); // [87, 1, 2, 3, 0]
// Fixed length list length can't be changed or increased
  fixedLengthList.length = 0;  // Throws
  fixedLengthList.add(499);    // Throws

  // Fixed-size list
  var pastries = List<String>.filled(3, 'not available');
  // Element access by index
  pastries[0] = 'cookies';
  pastries[1] = 'cupcakes';
  pastries[2] = 'donuts';

  // Growable list
  List<String> desserts = [];
  desserts.add('cookies');

  // Initialize by growable list
  var dessertMenu = ['cookies', 'cupcakes', 'pie'];

  // List properties and methods
  dessertMenu.length; // 3
  dessertMenu.first; // 'cookies
  dessertMenu.last; // 'pie
  dessertMenu.isEmpty; // false
  dessertMenu.isNotEmpty; // true
  dessertMenu.firstWhere((str) => str.length < 4); // pie

  // Collection if
  var peanutAllergy = true;
  var candy = [
    'junior mints',
    'twizzlers',
    if (!peanutAllergy) 'reeses',
  ];

  // Collection for
  var numbers = [1, 2, 3];
  var doubledNumbers = [for (var number in numbers) 2 * number]; // [2, 4, 6]
}

String status(Light state) => switch (state) {
      Light.on => 'Light is on',
      Light.off => 'Light is off',
      Light.auto => 'Light is auto'
    };

Function hero({required num powerLevel}) {
  return ({required num powerMultiplier}) => powerLevel * powerMultiplier;
}
