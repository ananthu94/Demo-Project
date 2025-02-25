import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce_demo/models/productmodel/productmodel.dart';
import 'package:ecommerce_demo/statemanagement/cartProvider/cartprovider.dart';
import 'package:ecommerce_demo/statemanagement/WishlistProvider/wishlistprovider.dart';

class ProductPage extends StatefulWidget {
  final Map<String, dynamic> product;

  ProductPage({required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width * 9,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (index) {
                          setState(() {
                            isLastPage = index == 2;
                          });
                        },
                        children: [
                          Image(
                            image: NetworkImage(widget.product['Pimages']),
                            fit: BoxFit.fill,
                          ),
                          Image(
                            image: NetworkImage(widget.product['Pimages']),
                            fit: BoxFit.fill,
                          ),
                          Image(
                            image: NetworkImage(widget.product['Pimages']),
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .45,
                        left: MediaQuery.of(context).size.width * .35),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.white60,
                        spacing: 15,
                      ),
                      onDotClicked: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: IconButton(
                        onPressed: () {
                          if (Provider.of<WishlistProvider>(context,
                                  listen: false)
                              .isInWishlist(widget.product)) {
                            Provider.of<WishlistProvider>(context,
                                    listen: false)
                                .removeFromWishlist(widget.product);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "${widget.product['title']} removed from wishlist")));
                          } else {
                            Provider.of<WishlistProvider>(context,
                                    listen: false)
                                .addToWishlist(widget.product);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "${widget.product['title']} added to wishlist")));
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Provider.of<WishlistProvider>(context)
                                  .isInWishlist(widget.product)
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.product['title'],
                style: TextStyle(color: Colors.redAccent, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product['price'],
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.product['description']),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Product product = Product.fromMap(widget.product);

                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${product.title} added to cart")),
                  );
                },
                color: Colors.yellow[800],
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
