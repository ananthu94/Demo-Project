import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/cart/cart.dart';
import 'package:ecommerce_demo/screens/profile/profile.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:ecommerce_demo/screens/orders/ordersmain.dart';
import 'package:ecommerce_demo/screens/wishlist/wishlist.dart';
import 'package:ecommerce_demo/screens/categories/categorymain.dart';

class DrawerHomepage extends StatelessWidget {
  const DrawerHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
            child: Image(
          image: AssetImage('assets/images/L7 logo.png'),
        )),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Profile(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Wishlist'),
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const WishList(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Cart(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.category),
          title: const Text('Categories'),
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CatogoryPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.done_all),
          title: const Text('Orders'),
          trailing: const Icon(Icons.chevron_right_outlined),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Orders(),
            ));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.power_settings_new),
          title: const Text('Logout'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
          },
        ),
      ],
    );
  }
}
