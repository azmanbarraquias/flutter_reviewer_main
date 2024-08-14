import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' as ord;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  static const routeName = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var isLoading = false;

  @override
  void initState() {
    isLoading = true;

    Provider.of<ord.Orders>(context, listen: false)
        .fetchAndSetOrder()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  /*  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        isLoading = true;
      });
      await Provider.of<ord.Orders>(context, listen: false).fetchAndSetOrder();
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<ord.Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders: ${orderData.orders.length} items'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
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
