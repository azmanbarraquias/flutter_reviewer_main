import 'package:flutter/foundation.dart';

xPrint(dynamic title, {String? content}) {
  if (kDebugMode) {
    print('Azman> $title ${content ?? ''}');
  }
}
