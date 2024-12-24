import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/orders/ordersscreens/orderfinalpage.dart';

class HistoryOrders extends StatelessWidget {
  const HistoryOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order no:111',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OrderFinalPage(),
                        ));
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30,
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('2 Items'), Text('Date 10/01/2024')],
                )
              ],
            );
          },
          itemCount: 17),
    ));
  }
}
