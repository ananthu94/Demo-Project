import 'package:flutter/material.dart';
import 'package:ecommerce_demo/widgets/drawer/drawer.dart';
import 'package:ecommerce_demo/screens/wishlist/wishlist.dart';
import 'package:ecommerce_demo/screens/homepage/listforhome.dart';
import 'package:ecommerce_demo/screens/productpage/productpage.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   final selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => WishlistScreen(),
//                 ));
//               },
//               icon: Padding(
//                 padding: EdgeInsets.only(right: 25),
//                 child: Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                   size: 30,
//                 ),
//               )),
//         ],
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
//                     suffixIcon: const Icon(Icons.search),
//                     labelText: 'Search',
//                     hintText: 'Search',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Explore',
//                   style: TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.width,
//                   child: ListView.builder(
//                     itemCount: homeListmap.length,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         padding: EdgeInsets.only(right: 10),
//                         child: Stack(
//                           children: [
//                             Opacity(
//                               opacity: 0.6,
//                               child: Container(
//                                 width: MediaQuery.of(context).size.width * .95,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Image(
//                                     image: NetworkImage(
//                                         homeListmap[index]['Pimages']),
//                                     fit: BoxFit.cover,
//                                     height: double.infinity,
//                                     width:
//                                         MediaQuery.of(context).size.width * 1,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     homeListmap[index]['title'],
//                                     style: TextStyle(
//                                         fontSize: 25, color: Colors.white),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   SizedBox(
//                                     width:
//                                         MediaQuery.of(context).size.width * .9,
//                                     child: Text(
//                                       homeListmap[index]['description'],
//                                       textAlign: TextAlign.justify,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 10,
//                               right: 10,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 height: 30,
//                                 width: 60,
//                                 child: Center(
//                                     child: Text(homeListmap[index]['price'])),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 const Text('Popular Products',
//                     style: TextStyle(fontSize: 18, color: Colors.red)),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 buildPopularProducts(homeListmap),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 const Text('More Popular Products',
//                     style: TextStyle(fontSize: 18, color: Colors.red)),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 buildPopularProducts(homeListmap),
//               ],
//             ),
//           ),
//         ),
//       ),
//       drawer: const Drawer(
//         backgroundColor: Colors.white,
//         child: DrawerHomepage(),
//       ),
//     );
//   }
// }

// Widget buildPopularProducts(List<Map<String, dynamic>> products) {
//   return SizedBox(
//     height: 250,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: products.length,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(right: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image(
//                   image: NetworkImage(products[index]['Pimages']),
//                   fit: BoxFit.cover,
//                   height: 200,
//                   width: MediaQuery.of(context).size.width * .5,
//                 ),
//               ),
//               Text(products[index]['title']),
//               Text(products[index]['price']),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final ValueNotifier<List<Map<String, dynamic>>> filteredProducts =
        ValueNotifier<List<Map<String, dynamic>>>(homeListmap);

    void _filterProducts(String query) {
      if (query.isEmpty) {
        filteredProducts.value = homeListmap;
      } else {
        filteredProducts.value = homeListmap
            .where((product) =>
                product['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WishlistScreen(),
                ));
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 25),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.redAccent,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                onChanged: (query) {
                  _filterProducts(query);
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  labelText: 'Search',
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Explore',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width,
                child: ValueListenableBuilder<List<Map<String, dynamic>>>(
                  valueListenable: filteredProducts,
                  builder: (context, filteredList, _) {
                    return ListView.builder(
                      itemCount: filteredList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      product: homeListmap[index],
                                    )));
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity: 0.6,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .95,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(
                                            filteredList[index]['Pimages']),
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredList[index]['title'],
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        child: Text(
                                          filteredList[index]['description'],
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 30,
                                    width: 60,
                                    child: Center(
                                        child:
                                            Text(filteredList[index]['price'])),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              const SizedBox(height: 10),
              const Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 5),
              ValueListenableBuilder<List<Map<String, dynamic>>>(
                valueListenable: filteredProducts,
                builder: (context, filteredList, _) {
                  return buildPopularProducts(filteredList);
                },
              ),
              const SizedBox(height: 10),
              Divider(),
              const Text(
                'More Popular Products',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              ValueListenableBuilder<List<Map<String, dynamic>>>(
                valueListenable: filteredProducts,
                builder: (context, filteredList, _) {
                  return buildPopularProducts(filteredList);
                },
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerHomepage(),
      ),
    );
  }
}

Widget buildPopularProducts(List<Map<String, dynamic>> products) {
  return SizedBox(
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductPage(
                      product: homeListmap[index],
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(products[index]['Pimages']),
                    fit: BoxFit.cover,
                    height: 200,
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                ),
                Text(
                  products[index]['title'],
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  products[index]['price'],
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
