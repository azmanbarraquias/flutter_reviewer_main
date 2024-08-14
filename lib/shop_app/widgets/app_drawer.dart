import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';

import '../screens/orders_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          AppBar(
            title: const Text('APP Drawer'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/') {
                xPrint('Same Page');
                Navigator.of(context).pop();
                return;
              }

              Navigator.of(context).pushReplacementNamed('/');
              xPrint('Open ${ModalRoute.of(context)?.settings.name}');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/orders') {
                xPrint('Same Page');
                Navigator.of(context).pop();
                return;
              }
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
              xPrint('Open ${ModalRoute.of(context)?.settings.name}');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Product'),
            onTap: () {
              Navigator.of(context).pushNamed(UserProductScreen.routeName);
              xPrint('Open ${ModalRoute.of(context)?.settings.name}');
            },
          )
        ],
      ),
    );
  }
}
