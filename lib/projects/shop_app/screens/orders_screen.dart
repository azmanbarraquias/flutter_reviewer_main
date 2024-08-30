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
  late Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<ord.Orders>(context, listen: false).fetchAndSetOrder();
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
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<ord.Orders>(context);
    return Scaffold(
      appBar: AppBar(
        // title: Text('Your Orders: ${orderData.orders.length} items'),
        title: const Text('Your Orders:'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
          future: _ordersFuture,
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                // Check Error stuff.
                return Center(
                    child: Text('an error occurred: ${dataSnapshot.error}'));
              } else {
                return Consumer<ord.Orders>(
                  builder: (_, orderData, __) {
                    return ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (_, i) {
                        return OrderItem(order: orderData.orders[i]);
                      },
                    );
                  },
                );
              }
            }
          }),
    );
  }
}
