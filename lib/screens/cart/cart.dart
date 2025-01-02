import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../statemanagement/cartProvider/cartprovider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: cart.cartItems.isEmpty
          ? const Center(child: Text('No items in the cart!'))
          : Consumer<CartModel>(
              builder: (context, cartProvider, child) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.cartItems.length,
                        itemBuilder: (ctx, index) {
                          var item = cart.cartItems[index];
                          var product = item.key;
                          var quantity = item.value;
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
                                      product.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(product.price),
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
                                            cart.removeFromCart(product);
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text('$quantity'),
                                        IconButton(
                                          onPressed: () {
                                            cart.addToCart(product);
                                          },
                                          icon: const Icon(Icons.add),
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
                    Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red[900],
                          onPressed: () {
                            cart.clearCart();
                          },
                          child: const Text(
                            'Clear All',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.red[900],
                          onPressed: () {
                            // Handle cart confirmation
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
    );
  }
}
