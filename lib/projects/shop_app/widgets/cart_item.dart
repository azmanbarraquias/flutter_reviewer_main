import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_product.dart';
import '../provider/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});

  final CartProduct cart;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content:
                    const Text('Do you want to remove the item from the cart?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('No'),
                  )
                ],
              );
            });
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(cart);
      },
      key: ValueKey(cart.id),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('x${cart.quantity}'),
              ),
              title: Text(cart.product.title ?? ''),
              subtitle: Text('\$${cart.product.price}'),
              trailing: Text('Total: \$${cart.total.toStringAsFixed(2)}'),
            ),
          )),
    );
  }
}
