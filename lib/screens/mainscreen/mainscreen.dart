import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/cart/cart.dart';
import 'package:ecommerce_demo/screens/profile/profile.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  final List<Widget> _screens = [
    const HomePage(),
    const CartScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.red[900],
            selectedItemColor: Colors.white,
            currentIndex: index,
            onTap: (newIndex) {
              _selectedIndex.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}
