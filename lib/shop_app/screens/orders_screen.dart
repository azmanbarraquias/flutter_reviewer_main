import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' as ord;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<ord.Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders: ${orderData.orders.length} items'),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) {
            return OrderItem(
              order: orderData.orders[i],
            );
          }),
      drawer: const AppDrawer(),
    );
  }
}
