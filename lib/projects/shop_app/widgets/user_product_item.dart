import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/projects/shop_app/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../provider/product.dart';
import '../provider/products.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? ''),
      leading: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.contain,
        imageUrl: product.imageUrl ?? '',
        imageBuilder: (context, imageProvider) {
          // you can access to imageProvider
          return CircleAvatar(
            // or any widget that use imageProvider like (PhotoView)
            backgroundImage: imageProvider,
          );
        },
      ),
      trailing: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName,
                      arguments: product);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                )),
            IconButton(
                onPressed: () async {
                  Provider.of<Products>(context, listen: false)
                      .deleteProduct(product)
                      .then((_) {
                    scaffoldKey.currentState?.showSnackBar(SnackBar(
                      content: Text('${product.title} has been deleted'),
                    ));
                  }).catchError((error) {
                    scaffoldKey.currentState?.showSnackBar(SnackBar(
                      content: Text('$error'),
                    ));
                  });
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //   content: Text('Yay! A SnackBar!'),
                  //
                  // ));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}