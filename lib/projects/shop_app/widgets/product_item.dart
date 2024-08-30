import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/product.dart';
import '../screens/products_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false); // rerun build

    final cart = Provider.of<Cart>(context, listen: false); // rerun build

    xPrint('ProductItem build ${product.title}');
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // only rerun subpart of widget
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(builder: (_, product, __) {
            xPrint(
                'ProductItem isFavorite ${product.title} :${product.isFavorite}');
            return IconButton(
              icon: Icon(product.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            );
          }),
          trailing: IconButton(
            icon: const Icon(
                false ? Icons.shopping_cart : Icons.shopping_cart_outlined),
            onPressed: () {
              cart.addToCart(product);
              // Nearest scaffold
              Material.of(context).color;
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 1000),
                  content: Text('Added ${product.title} to the cart'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
          backgroundColor: Colors.black45,
          title: Text(product.title ?? ''),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product,
            );
          },
          child: CachedNetworkImage(
            placeholder: (ctx, str) => const CircularProgressIndicator(),
            imageUrl: product.imageUrl ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
