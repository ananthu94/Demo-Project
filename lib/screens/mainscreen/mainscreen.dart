import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/profile/profile.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';
import 'package:ecommerce_demo/screens/wishlist/wishlist.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // ValueNotifier to manage the selected index in BottomNavigationBar
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  // List of screens for the BottomNavigationBar
  final List<Widget> _screens = [
    const HomePage(),
    const WishlistScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return _screens[index]; // Display screen based on selected index
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
              _selectedIndex.value = newIndex; // Update selected index
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}
