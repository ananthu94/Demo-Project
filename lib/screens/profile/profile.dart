import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/cart/cart.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';
import 'package:ecommerce_demo/screens/orders/ordersmain.dart';
import 'package:ecommerce_demo/screens/wishlist/wishlist.dart';
import 'package:ecommerce_demo/screens/profile/editprofile.dart';
import 'package:ecommerce_demo/firebase%20Auth/authservices.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final selectedIndex = 3;

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WishlistScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1))
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/profileAddSample.png'))),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'ANANTHU C',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            Column(children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ));
                },
                leading: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.black54,
                ),
                title:
                    const Text('Edit Profile', style: TextStyle(fontSize: 20)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => ShoppingAddress(),
                  // ));
                },
                leading: const Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.black45,
                ),
                title: const Text('Shopping Address',
                    style: TextStyle(fontSize: 20)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WishlistScreen(),
                  ));
                },
                leading: const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.black45,
                ),
                title: const Text('Wishlist', style: TextStyle(fontSize: 20)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Orders()));
                },
                leading: const Icon(
                  Icons.done_all,
                  size: 30,
                  color: Colors.black45,
                ),
                title: const Text('Orders', style: TextStyle(fontSize: 20)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => const Cards(),
              //     ));
              //   },
              //   leading: const Icon(
              //     Icons.card_membership,
              //     size: 30,
              //     color: Colors.black45,
              //   ),
              //   title: const Text('Cards',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20)),
              //   trailing: const Icon(
              //     Icons.arrow_forward_ios,
              //     color: Colors.black,
              //     size: 15,
              //   ),
              // ),
              ListTile(
                onTap: () async {
                  await AuthService().signout();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                leading: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.black45,
                ),
                title: const Text('Logout', style: TextStyle(fontSize: 20)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ])
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        backgroundColor: Colors.red[900],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



// images == null
//                       ? Container(
//                           width: 150,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 4, color: Colors.white),
//                             boxShadow: [
//                               BoxShadow(
//                                   spreadRadius: 2,
//                                   blurRadius: 10,
//                                   color: Colors.black.withOpacity(0.1))
//                             ],
//                             shape: BoxShape.circle,
//                             image: const DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage(
//                                     'assets/images/profileAddSample.png')),
//                           ),
//                         )
//                       : Container(
//                           width: 150,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 4, color: Colors.white),
//                             boxShadow: [
//                               BoxShadow(
//                                   spreadRadius: 2,
//                                   blurRadius: 10,
//                                   color: Colors.black.withOpacity(0.1))
//                             ],
//                             shape: BoxShape.circle,
//                             image: const DecorationImage(
//                                 fit: BoxFit.cover, image: FileImage(images!)),
//                           ),
//                         ),