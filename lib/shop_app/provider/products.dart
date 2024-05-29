import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Product> get products {
    // return a copy
    return [..._products];
  }

  void addProduct(Product product) {
    var idProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    _products.add((idProduct));
    notifyListeners();
  }

  // bool _showFavorites = false;
  //
  // bool get isFev {
  //   return _showFavorites;
  // }
  //
  // void showFev() {
  //   _showFavorites = true;
  //   notifyListeners();
  //
  // }
  //
  // void showAll() {
  //   _showFavorites = false;
  //   notifyListeners();
  //
  // }

  Product findByProduct(Product product) {
    return products.firstWhere((productProv) => productProv.id == product.id);
  }

  // dart don't have overloading
  Product findById(String productID) {
    return products.firstWhere((productProv) => productProv.id == productID);
  }

  List<Product> get favoritesItems {
    // if (_showFavorites) {
    return _products.where((product) => product.isFavorite).toList();
    // } else {
    //   return products;
    // }
  }
}
