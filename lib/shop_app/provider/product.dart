import 'package:flutter/material.dart';

import '../../x_experiment/flutter_lifecycle.dart';

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final num? price;
  final String? imageUrl;
  bool isFavorite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price = 0,
      this.imageUrl,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    xPrint('$title is favorite set to $isFavorite.');
    notifyListeners();
  }
}
