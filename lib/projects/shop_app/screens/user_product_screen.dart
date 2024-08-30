import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widgets/user_product_item.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  static const routeName = 'user-products';

  Future<void> _refreshProduct(BuildContext context) async {
    Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: true);

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
      body: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.products.length,
            itemBuilder: (ctx, i) {
              return UserProductItem(
                product: products.products[i],
              );
            }),
      ),
    );
  }
}
