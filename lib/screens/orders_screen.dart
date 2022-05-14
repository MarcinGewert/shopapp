import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/ordersScreen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  late Future _ordersFuture ;
  Future _obtainOrdersFuture()async {
    return await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture() ;
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your orders'),
        ),
        drawer: appDrawer(),
        body: FutureBuilder(
            future:
                _ordersFuture,
            builder: (ctx, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (dataSnapshot.hasError) {
                  return Center(
                    child: Text('An error occured'),
                  );
                } else {
                  return Consumer<Orders>(
                    builder: (ctx, orderProv, child) => ListView.builder(
                      itemCount: orderProv.orders.length,
                      itemBuilder: (ctx, i) => OrderItem(orderProv.orders[i]),
                    ),
                  );
                }
              }
            }));
  }
}
