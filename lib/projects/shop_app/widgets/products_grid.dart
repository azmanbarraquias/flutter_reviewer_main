import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';
import '../provider/products.dart';
import 'product_item.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key, required this.showFavorite});

  final bool showFavorite;

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    final Products proProvider = Provider.of<Products>(context,
        listen: true); // refresh if product added new item.
    final List<Product> products =
        widget.showFavorite ? proProvider.favoritesItems : proProvider.products;

    return RefreshIndicator(
      onRefresh: () => proProvider.fetchAndSetProducts(),
      child: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: products[i],
            child: ProductItem(key: ValueKey(products[i].id)),
          );
        },
      ),
    );
  }
}
