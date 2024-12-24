import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/landing/landingScreen/landing_screen_container.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return buildPage(
        color: Colors.red,
        urlimage: 'assets/images/landingScreen3.avif',
        title: 'Payment',
        subtitle:
            'Nisi eiusmod officia amet veniam veniam ex laborum duis sit commodo.');
  }
}
