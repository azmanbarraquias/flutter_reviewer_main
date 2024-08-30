import 'cart_product.dart';

class Order {
  final String id;
  final double amount;
  final List<CartProduct> products;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}
