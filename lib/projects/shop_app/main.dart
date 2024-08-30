import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/firebase_options.dart';
import 'package:flutter_reviewer_main/projects/shop_app/provider/auth.dart';
import 'package:provider/provider.dart';
import 'provider/cart.dart';
import 'provider/orders.dart';
import 'provider/products.dart';
import 'screens/cart_screen.dart';
import 'screens/edit_product_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/products_details_screen.dart';
import 'screens/user_product_screen.dart';
import 'screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final providersList = [
      ChangeNotifierProvider(create: (ctx) => Auth()),
      ChangeNotifierProvider(create: (ctx) => Products()),
      ChangeNotifierProvider(create: (ctx) => Cart()),
      ChangeNotifierProvider(create: (ctx) => Orders()),
    ];

    final themeData = ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize),
      ),
    );

    final routeList = {
      ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
      CartScreen.routeName: (ctx) => const CartScreen(),
      OrdersScreen.routeName: (ctx) => const OrdersScreen(),
      UserProductScreen.routeName: (ctx) => const UserProductScreen(),
      EditProductScreen.routeName: (ctx) => const EditProductScreen(),
    };

    return MultiProvider(
        providers: providersList,
        child: Consumer<Auth>(builder: (ctx, auth, _) {
          return MaterialApp(
            scaffoldMessengerKey: scaffoldKey,
            title: 'MyShop',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home:
                auth.isAuth ? const ProductDetailsScreen() : const AuthScreen(),
            routes: routeList,
          );
        }));
  }
}
