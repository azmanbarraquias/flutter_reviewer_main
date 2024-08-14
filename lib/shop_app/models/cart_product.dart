
import '../provider/product.dart';

class CartProduct {
  final String id;
  final Product product;
  final int quantity;

  get total => product.price! * quantity;

  CartProduct({required this.id, required this.product, required this.quantity});
}