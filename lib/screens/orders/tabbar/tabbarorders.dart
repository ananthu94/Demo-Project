import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/orders/ordersscreens/historyorders.dart';
import 'package:ecommerce_demo/screens/orders/ordersscreens/ongoingorders.dart';

class TabbarWidgetOrders extends StatelessWidget {
  const TabbarWidgetOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TabBar(tabs: [
          Tab(
            text: 'Ongoing',
          ),
          Tab(
            text: 'History',
          ),
        ]),
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .83,
            width: double.infinity,
            child: const TabBarView(children: [
              OnGoingOrders(),
              HistoryOrders(),
            ]),
          ),
        )
      ],
    );
  }
}
