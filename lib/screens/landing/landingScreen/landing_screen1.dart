import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/landing/landingScreen/landing_screen_container.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return buildPage(
        color: Colors.red,
        urlimage: 'assets/images/landingScreen1.avif',
        title: 'Create an account',
        subtitle:
            'Et adipisicing do enim duis amet id culpa. Commodo adipisicing.');
  }
}
