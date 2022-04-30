import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static const routeName = '/ordersScreen';

  @override
  Widget build(BuildContext context) {
    final orderProv = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        title: Text('Summarise your order'),
      ),

      body: ListView.builder(
        itemCount: orderProv.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderProv.orders[i]),
      ),
    );
  }
}
