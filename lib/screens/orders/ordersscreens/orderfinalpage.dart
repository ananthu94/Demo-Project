import 'package:flutter/material.dart';

class OrderFinalPage extends StatelessWidget {
  const OrderFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Information'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Order Information'),
          const Text('Delivery to'),
          // Container(
          //   color: Colors.amber,
          //   height: 150,
          //   width: double.infinity,
          //   child: const Text('Location Map'),
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            color: Colors.grey[400],
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery '),
                  Text('10:20 AM'),
                  Text('20/11/2024'),
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                    'https://plus.unsplash.com/premium_photo-1705169612592-32610774a5d0?q=80&w=2040&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                title: const Text('Name'),
                subtitle: const Text('Price'),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Subtotal(1 Item)'), Text('\$2')],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Shipping Fee'), Text('\$2')],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total'), Text('\$2')],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.all(10),
          //   color: Colors.grey[400],
          //   child: const Text('Note'),
          // ),
          // const Text('NOTE : This is a note on the product delivery.')
        ],
      ),
    );
  }
}
