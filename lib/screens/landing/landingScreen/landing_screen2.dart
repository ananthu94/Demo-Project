import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/landing/landingScreen/landing_screen_container.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return buildPage(
        color: Colors.red,
        urlimage: 'assets/images/landingScreen2.jpg',
        title: 'Add to Cart',
        subtitle:
            'Ipsum officia eu amet Lorem amet pariatur culpa reprehenderit esse irure.');
  }
}
