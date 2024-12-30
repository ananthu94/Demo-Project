import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_demo/statemanagement/WishlistProvider/wishlistprovider.dart';

// import 'package:flutter/material.dart';
// import 'package:ecommerce_demo/screens/categories/categorylistmap/categorydetails.dart';

// class WishList extends StatelessWidget {
//   const WishList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wishlist'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
//         child: ListView.builder(
//             itemBuilder: (context, index) {
//               return Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(20)),
//                 margin: const EdgeInsets.all(5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30)),
//                       height: 100,
//                       width: 100,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image(
//                           image: NetworkImage(
//                             categoryAll.elementAt(index)['Pimages'],
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 5, top: 5),
//                       child: Column(
//                         children: [
//                           Text(
//                             categoryAll.elementAt(index)['title'],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                           Text(categoryAll.elementAt(index)['price']),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.only(right: 5),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.delete)),
//                             MaterialButton(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               color: Colors.yellow[700],
//                               onPressed: () {},
//                               child: const Text('Add to cart'),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//             itemCount: 3),
//       ),
//     );
//   }
// }

// The WishlistProvider class

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        centerTitle: true,
      ),
      body: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, child) {
          List<Map<String, dynamic>> wishlist = wishlistProvider.wishlist;

          if (wishlist.isEmpty) {
            return const Center(
              child: Text('Your wishlist is empty'),
            );
          }

          return ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              final item = wishlist[index];
              return ListTile(
                leading: Image.network(
                  item['Pimages'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(item['title']),
                subtitle: Text(item['price']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Remove from wishlist
                    wishlistProvider.removeFromWishlist(item);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
