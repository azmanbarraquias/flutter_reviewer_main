import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static Icon getRandomIcon() {
    final Random random = Random();
    const String chars = '0123456789ABCDEF';
    int length = 3;
    String hex = '0xe';
    while (length-- > 0) {
      hex += chars[(random.nextInt(16)) | 0];
    }
    return Icon(IconData(int.parse(hex), fontFamily: 'MaterialIcons'));
  }

  static IconData getRandomIconData() {
    final Random random = Random();
    const String chars = '0123456789ABCDEF';
    int length = 3;
    String hex = '0xe';
    while (length-- > 0) {
      hex += chars[(random.nextInt(16)) | 0];
    }
    return IconData(int.parse(hex), fontFamily: 'MaterialIcons');
  }

  static Color getRandomColor() {
    return Colors.accents[Random().nextInt(
      Colors.accents.length,
    )];
  }

  static double? checkDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static int? checkInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}
