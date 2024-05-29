import 'package:flutter/cupertino.dart';

import '../models/cart_product.dart';
import '../models/order.dart';

class Orders with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartProduct> cartProduct, double total) {
    if (cartProduct.isEmpty) return;
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProduct,
            dateTime: DateTime.now()));
    notifyListeners();
  }

  void clear() {
    _orders.clear();
    notifyListeners();
  }
}
