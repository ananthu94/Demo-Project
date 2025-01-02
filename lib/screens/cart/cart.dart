import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../statemanagement/cartProvider/cartprovider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          List<Map<String, dynamic>> cartItems = cartProvider.cartItems;

          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                item['Pimages'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(item['price']),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartProvider.removeFromCart(item);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Update quantity logic
                                      int newQuantity = item['quantity'] + 1;
                                      cartProvider.updateQuantity(
                                          item, newQuantity);
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                  Text('${item['quantity']}'),
                                  IconButton(
                                    onPressed: () {
                                      // Update quantity logic
                                      int newQuantity = item['quantity'] > 1
                                          ? item['quantity'] - 1
                                          : 1;
                                      cartProvider.updateQuantity(
                                          item, newQuantity);
                                    },
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.red[900],
                minWidth: double.infinity,
                onPressed: () {
                  // Handle cart confirmation
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
