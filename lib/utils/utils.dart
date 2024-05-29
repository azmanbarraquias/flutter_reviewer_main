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
}
