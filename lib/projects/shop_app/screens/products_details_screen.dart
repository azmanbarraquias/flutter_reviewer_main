import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';
import '../provider/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static String routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;

    final productProvider =
        Provider.of<Products>(context, listen: false).findByProduct(product);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(productProvider.title ?? ''),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Hero(
                  tag: product.id!,
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/pls_wait.png'),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.imageUrl ?? '',
                    ),
                  )),
              title: Text(
                productProvider.title ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$${product.price}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${product.description}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(
              height: 800,
            ),
          ])),
        ],
      ),
    );
  }
}
