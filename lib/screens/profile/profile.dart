import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:ecommerce_demo/screens/orders/ordersmain.dart';
import 'package:ecommerce_demo/screens/wishlist/wishlist.dart';
import 'package:ecommerce_demo/screens/profile/editprofile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
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
          Expanded(
              child: Column(children: [
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
              title: const Text('Edit Profile', style: TextStyle(fontSize: 20)),
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
                  builder: (context) => const WishList(),
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
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
          ]))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red[900],
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
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