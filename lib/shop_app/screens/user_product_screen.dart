import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widgets/user_product_item.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  static const routeName = 'user-products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
              );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: products.products.length,
          itemBuilder: (ctx, i) {
            return UserProductItem(
              product: products.products[i],
            );
          }),
    );
  }
}
