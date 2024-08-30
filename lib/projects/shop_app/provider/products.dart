import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/projects/shop_app/models/http_exception.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  List<Product> get products {
// return a copy
    return [..._products];
  }

  Future<void> fetchAndSetProducts() async {
    // _products = [];
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';
    final url = Uri.https(urlLink, '/products.json');

    try {
      final response = await http.get(url);
      final productsJson = json.decoder.convert(response.body);
      final List<Product> loadedProducts = [];
      final products = productsJson as Map<String, dynamic>;
      products.forEach((productId, productData) {
        loadedProducts.add(Product(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          price: double.tryParse(productData['price'].toString()),
          isFavorite: productData['isFavorite'],
          imageUrl: productData['imageUrl'],
        ));
      });
      _products = loadedProducts;
      notifyListeners();
      xPrint('fetchAndSetProducts: ${json.decoder.convert(response.body)}');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addProduct(Product product) async {
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';

    try {
      final url = Uri.https(urlLink, '/products.json');

      final response = await http.post(url,
          body: json.encoder.convert({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          }));

      final responseFromServer = json.decoder.convert(response.body)['error'];

      final idProduct = Product(
          id: json.decoder.convert(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);

      if (responseFromServer == 'Permission denied') {
        throw Exception('Permission denied');
      }

      _products.add((idProduct));

      notifyListeners();

      xPrint('Response Message: $responseFromServer');
    } catch (error) {
      xPrint('error> $error, at addProduct()');
      rethrow;
    }
  }

  Future<void> addProduct1(Product product) async {
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';
    final url = Uri.https(
      urlLink,
      '/products.json',
    );

    await http
        .post(url,
            body: json.encoder.convert({
              'title': product.title,
              'description': product.description,
              'imageUrl': product.imageUrl,
              'price': product.price,
              'isFavorite': product.isFavorite,
            }))
        .then((response) {
      // since post is a future function we can use then.

      var idProduct = Product(
          id: json.decoder.convert(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);

      _products.add((idProduct));

      notifyListeners();

      xPrint('Response: ${json.decoder.convert(response.body)}');
    }).catchError((error) {
      xPrint('error> $error, at addProduct()');
      throw error;
    });
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
//,
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

  Future<void> updateProduct(Product productUpdate) async {
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';
    final prodIndex =
        products.indexWhere((product) => product.id == productUpdate.id);
    try {
      if (prodIndex >= 0) {
        final url = Uri.https(urlLink, '/products/${productUpdate.id}.json');

        final response = await http.patch(url,
            body: json.encoder.convert({
              'title': productUpdate.title,
              'description': productUpdate.description,
              'imageUrl': productUpdate.imageUrl,
              'price': productUpdate.price,
              // 'isFavorite': productUpdate.isFavorite,
            }));
        _products[prodIndex] = productUpdate;

        final responseFromServer = json.decoder.convert(response.body);
        xPrint('updateProduct $responseFromServer');

        notifyListeners();
        // fetchAndSetProducts();
      }
    } catch (error) {
      xPrint(error);
      rethrow;
    }
  }

  Future<void> deleteProduct(Product productUpdate) async {
    // 200, 201, 300, 400, 500
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';
    final url = Uri.https(urlLink, '/products/${productUpdate.id}.json');

    final index =
        products.indexWhere((product) => product.id == productUpdate.id);
    Product? tempProduct = products[index];
    _products.removeAt(index);
    notifyListeners();
    try {
      final response = await http.delete(url);
      xPrint('deleteProduct statusCode: ${response.statusCode}');
      if (response.statusCode >= 400) {
        throw HttpException(response.body);
      }
      xPrint('deleteProduct ${tempProduct.title} has been deleted');
      tempProduct = null;
    } catch (error) {
      _products.insert(index, tempProduct!);
      notifyListeners();
      throw HttpException(error.toString());
      // rethrow;
      // rethrow;
    }
  }

  Future<void> deleteProduct1(Product productUpdate) async {
    // 200, 201, 300, 400, 500
    const urlLink = 'myflutter-update-default-rtdb.firebaseio.com';
    final url = Uri.https(urlLink, '/products/${productUpdate.id}.json');

    final index =
        products.indexWhere((product) => product.id == productUpdate.id);
    Product? tempProduct = products[index];

    var test = await http.delete(url).then((m) {
      if (m.statusCode >= 400) {
        xPrint('deleteProduct error: ${m.statusCode}');
      }

      xPrint('deleteProduct ${tempProduct?.title} has been deleted');
      tempProduct = null;
    }).catchError((error) {
      xPrint('deleteProduct error: $error');
      _products.insert(index, tempProduct!);
      notifyListeners();
    });
    xPrint('deleteProduct $test');
    _products.removeAt(index);
    notifyListeners();
  }

  List<Product> get favoritesItems {
// if (_showFavorites) {
    return _products.where((product) => product.isFavorite).toList();
// } else {
//   return products;
// }
  }
}
