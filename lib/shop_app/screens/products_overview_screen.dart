import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../x_experiment/flutter_lifecycle.dart';
import '../provider/cart.dart';

import '../provider/products.dart';
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
  bool _isInit = true;
  bool _isLoading = false;

  _ProductsOverviewScreenState() {
    xPrint('_ProductsOverviewScreenState: constructor');
  }

  @override
  void initState() {
    xPrint('_ProductsOverviewScreenState: initState');
    super.initState();
  }

  @override
  void dispose() {
    xPrint('_ProductsOverviewScreenState: dispose');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    xPrint('_ProductsOverviewScreenState: didChangeDependencies');
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      xPrint('_ProductsOverviewScreenState: didChangeDependencies _isInit');
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    xPrint('_ProductsOverviewScreenState: build');
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
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : ProductGrid(
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
