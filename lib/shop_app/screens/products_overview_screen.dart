import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../provider/cart.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart' as consumer_badge;
import 'cart_screen.dart';

enum FilterOptions { all, favorite }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  static String routeName = '/product-overview-screen';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          Consumer<Cart>(
            builder: (_, value, child) {
              return consumer_badge.Badge(
                value: value.itemCount.toString(),
                child: child!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions filOp) {
              setState(() {
                switch (filOp) {
                  case FilterOptions.all:
                    _showOnlyFavorites = false;
                    break;
                  case FilterOptions.favorite:
                    _showOnlyFavorites = true;
                    break;
                  default:
                    _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (ctx) => FilterOptions.values
                .map((val) => PopupMenuItem(
                      value: val,
                      child: Text(val.name),
                    ))
                .toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ProductGrid(
            showFavorite: _showOnlyFavorites,
          ),
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    return Future.delayed(const Duration(seconds: 1))
        .then((value) => xPrint('Refresh'));
  }
}
