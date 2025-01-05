import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_demo/statemanagement/cartProvider/cartprovider.dart';

class OrderFinalPage extends StatelessWidget {
  const OrderFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    double taxRate = 0.1;
    double taxAmount = cart.totalPrice * taxRate;
    double totalPrice = cart.totalPrice + taxAmount;
    int numberOfProducts = cart.cartItems.length;
    int totalItems = cart.cartItems.fold(0, (sum, item) => sum + item.value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Information'),
      ),
      body: cart.cartItems.isEmpty
          ? const Center(child: Text('No items in the cart!'))
          : Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Order Information'),
                  const Text('Delivery to'),
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.cartItems.length,
                      itemBuilder: (ctx, index) {
                        var item = cart.cartItems[index];
                        var product = item.key;
                        var quantity = item.value;
                        final productPrice = (product.price * quantity);
                        print(productPrice);
                        return Card(
                          child: ListTile(
                            leading: Image.network(product.imageUrl,
                                width: 50, height: 50, fit: BoxFit.cover),
                            title: Text(product.title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${product.price} x $quantity'),
                                Text(productPrice),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Products: ',
                            style: TextStyle(fontSize: 16)),
                        Text('$numberOfProducts products',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Items: ', style: TextStyle(fontSize: 16)),
                        Text('$totalItems items',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal:', style: TextStyle(fontSize: 16)),
                        Text('\$${cart.totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tax (10%):',
                            style: TextStyle(fontSize: 16)),
                        Text('\$${taxAmount.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "Complete Purchase",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
