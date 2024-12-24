import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce_demo/widgets/bottonnavigationbar/bottomnavbar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

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
                        children: const [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            fit: BoxFit.cover,
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .47,
                        left: MediaQuery.of(context).size.width * .75),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const Text('Chair'),
              Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .7),
                  child: const Text('\u0024 10.99')),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'An office chair, or desk chair, is a type of chair that is designed for use at a desk in an office. It is usually a swivel chair, with a set of wheels for mobility and adjustable height. Modern office chairs typically use a single, distinctive load bearing leg (often called a gas lift), which is positioned underneath the chair seat. Near the floor this leg spreads out into several smaller feet, which are often wheeled and called casters. Office chairs were developed around the mid-19th century as more workers spent their shifts sitting at a desk, leading to the adoption of several features not found on other chairs.'),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
