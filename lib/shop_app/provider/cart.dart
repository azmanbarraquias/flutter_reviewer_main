import 'package:flutter/foundation.dart';

import '../../utils/xprint.dart';
import '../models/cart_product.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  final Map<String, CartProduct> _items = {};

  Map<String, CartProduct> get items {
    return {..._items};
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id!,
          (value) => CartProduct(
              id: value.id,
              product: value.product,
              quantity: value.quantity + 1));
    } else {
      _items.putIfAbsent(
          product.id!,
          () => CartProduct(
              id: DateTime.now().toString(), product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(CartProduct cartProduct) {
    xPrint('card product removed: ${cartProduct.product.title}');
    _items.remove(cartProduct.product.id);
    notifyListeners();
  }

  void removeSingleItem(String? productID) {
    if (!_items.containsKey(productID)) {
      return;
    }

    if (_items[productID]!.quantity > 1) {
      _items.update(
            productID!,
          (product) => CartProduct(
              id: product.id,
              product: product.product,
              quantity: product.quantity - 1));
    } else {
      _items.remove(productID);
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.product.price ?? 0 * cartItem.quantity;
    });

    return total;
  }
}
