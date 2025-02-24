import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_demo/screens/cart/cart.dart';
import 'package:ecommerce_demo/models/productmodel/productmodel.dart';
import 'package:ecommerce_demo/statemanagement/cartProvider/cartprovider.dart';
import 'package:ecommerce_demo/statemanagement/WishlistProvider/wishlistprovider.dart';
import 'package:ecommerce_demo/screens/categories/categorylistmap/categorydetails.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  final selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ));
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: 30,
                ),
              ))
        ],
      ),
      body: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, child) {
          List<Map<String, dynamic>> wishlist = wishlistProvider.wishlist;

          if (wishlist.isEmpty) {
            return const Center(
              child: Text('Your wishlist is empty'),
            );
          }

          return Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
            child: ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                var productData = categoryAll[index];
                var product = Product(
                  title: productData['title'],
                  description: productData['description'],
                  price: productData['price'],
                  color: productData['color'],
                  imageUrl: productData['Pimages'],
                );
                final item = wishlist[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(item['Pimages']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Column(
                          children: [
                            Text(
                              item['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(item['price']),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Remove item?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              wishlistProvider
                                                  .removeFromWishlist(item);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Yes'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('No'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.delete)),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.yellow[700],
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addToCart(product);
                                },
                                child: const Text('Add to cart'),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
