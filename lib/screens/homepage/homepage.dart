import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/cart/cart.dart';
import 'package:ecommerce_demo/widgets/drawer/drawer.dart';
import 'package:ecommerce_demo/screens/profile/profile.dart';
import 'package:ecommerce_demo/screens/wishlist/wishlist.dart';
import 'package:ecommerce_demo/screens/homepage/listforhome.dart';
import 'package:ecommerce_demo/screens/productpage/productpage.dart';

// import 'package:flutter/material.dart';
// import 'package:ecommerce_demo/widgets/drawer/drawer.dart';
// import 'package:ecommerce_demo/screens/productpage/productpage.dart';
// import 'package:ecommerce_demo/widgets/bottonnavigationbar/bottomnavbar.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // automaticallyImplyLeading: false,
//         title: const Text('Dashboard'),
//       ),
//       body: SingleChildScrollView(
//         child: InkWell(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => const ProductPage(),
//             ));
//           },
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                       suffixIcon: const Icon(Icons.search),
//                       labelText: 'Search',
//                       hintText: 'Search',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//                 const Text('Explore'),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.width,
//                   child: ListView(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             color: Colors.blue,
//                             child: const Opacity(
//                               opacity: 0.5,
//                               child: Image(
//                                 image:
//                                     AssetImage('assets/images/reg_page.webp'),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text('Glass'),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 SizedBox(
//                                   width: MediaQuery.of(context).size.width,
//                                   child: const Text(
//                                       'sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 300, top: 310),
//                             child: Container(
//                               height: 30,
//                               width: 60,
//                               color: Colors.white,
//                               child: const Center(child: Text('\$20')),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Stack(
//                         children: [
//                           Container(
//                             color: Colors.blue,
//                             child: const Opacity(
//                               opacity: 0.5,
//                               child: Image(
//                                 image:
//                                     AssetImage('assets/images/reg_page.webp'),
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.all(15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Glass'),
//                                 SizedBox(
//                                   width: 400,
//                                   child: Text(
//                                       'sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 300, top: 310),
//                             child: Container(
//                               height: 30,
//                               width: 60,
//                               color: Colors.white,
//                               child: const Center(child: Text('\$20')),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Text('Popular Products'),
//                 SizedBox(
//                   height: 250,
//                   child: ListView(
//                     physics: const ScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     children: const [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage('assets/images/landingScreen2.jpg'),
//                             height: 200,
//                           ),
//                           Text('chair'),
//                           Text('\$20'),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage('assets/images/landingScreen2.jpg'),
//                             height: 200,
//                           ),
//                           Text('chair'),
//                           Text('\$20'),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage('assets/images/landingScreen2.jpg'),
//                             height: 200,
//                           ),
//                           Text('chair'),
//                           Text('\$20'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Text('Popular Products'),
//                 SizedBox(
//                   height: 250,
//                   child: ListView(
//                     physics: const ScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     children: const [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage('assets/images/landingScreen2.jpg'),
//                             height: 200,
//                           ),
//                           Text('chair'),
//                           Text('\$20'),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage('assets/images/landingScreen2.jpg'),
//                             height: 200,
//                           ),
//                           Text('chair'),
//                           Text('\$20'),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image(
//                             image:
//                                 AssetImage('assets/images/landingScreen2.jpg'),
//                             height: 200,
//                           ),
//                           Text('chair'),
//                           Text('\$20'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       drawer: const Drawer(
//         backgroundColor: Colors.white,
//         child: DrawerHomepage(),
//       ),
//       bottomNavigationBar: const BottomNavBar(),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final selectedIndex = 0;

  void _onItemTapped(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WishlistScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProductPage(),
            ));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    labelText: 'Search',
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Explore',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: homeListmap.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.6,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .95,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: NetworkImage(
                                        homeListmap[index]['Pimages']),
                                    fit: BoxFit.cover,
                                    height: double.infinity,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeListmap[index]['title'],
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Text(
                                      homeListmap[index]['description'],
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 30,
                                width: 60,
                                child: Center(
                                    child: Text(homeListmap[index]['price'])),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text('Popular Products',
                    style: TextStyle(fontSize: 18, color: Colors.red)),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeListmap.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image:
                                    NetworkImage(homeListmap[index]['Pimages']),
                                fit: BoxFit.cover,
                                height: 200,
                                width: MediaQuery.of(context).size.width * .5,
                              ),
                            ),
                            Text(homeListmap[index]['title']),
                            Text(homeListmap[index]['price']),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text('More Popular Products',
                    style: TextStyle(fontSize: 18, color: Colors.red)),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeListmap.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image:
                                    NetworkImage(homeListmap[index]['Pimages']),
                                fit: BoxFit.cover,
                                height: 200,
                                width: MediaQuery.of(context).size.width * .5,
                              ),
                            ),
                            Text(homeListmap[index]['title']),
                            Text(homeListmap[index]['price']),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerHomepage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.red[900],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        onTap: (index) => _onItemTapped(context, index), // Handle tap events
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
