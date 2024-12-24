import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/orders/tabbar/tabbarorders.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Orders'),
            ),
            body: const TabbarWidgetOrders()));
  }
}
