import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price = 0,
      this.imageUrl,
      this.isFavorite = false});

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  void toggleFavoriteStatus() async {
    final oldFevStatus = isFavorite;
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';
    try {
      final url = Uri.https(urlLink, '/products/$id.json');
      isFavorite = !isFavorite;
      final response = await http.patch(url,
          body: json.encoder.convert({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) {
        _setFavValue(oldFevStatus);
        xPrint('${response.statusCode}');
        _setFavValue(oldFevStatus);
      }
      xPrint('toggleFavoriteStatus: ${json.decoder.convert(response.body)}');
    } catch (error) {
      _setFavValue(oldFevStatus);
      xPrint('$error');
    }
  }
}
