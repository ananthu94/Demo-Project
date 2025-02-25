import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce_demo/screens/homepage/listforhome.dart';
import 'package:ecommerce_demo/statemanagement/searchprovider/searchprovider.dart';
import 'package:ecommerce_demo/statemanagement/WishlistProvider/wishlistprovider.dart';

class ShelfCategory extends StatelessWidget {
  const ShelfCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQuery = Provider.of<SearchProvider>(context).searchQuery;

    final filteredCategories = homeListmap.where((category) {
      return category['title'].toLowerCase().contains(searchQuery) ||
          category['description'].toLowerCase().contains(searchQuery);
    }).toList();

    return Scaffold(
      body: GridView.builder(
        // itemCount: categoryAll.length,
        itemCount: filteredCategories.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 430,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          // final category = categoryAll[index];
          final category = filteredCategories[index];

          return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildCategoryImage(category['Pimages'], context, category),
                _buildCategoryTitle(category['title']),
                _buildCategoryDescription(category['description']),
                _buildCategoryColor(category['color']),
                _buildCategoryPrice(category['price']),
                _buildRatingBar(),
                const SizedBox(height: 5),
                _buildInfoRow(Icons.fire_truck, 'Get It Shipped'),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.warehouse_outlined, 'Pickup: Stoneridge'),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.av_timer, 'Same Day Delivery'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryImage(
      String imageUrl, BuildContext context, Map<String, dynamic> category) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          height: 190,
          width: 170,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              // Toggle wishlist state
              if (Provider.of<WishlistProvider>(context, listen: false)
                  .isInWishlist(category)) {
                Provider.of<WishlistProvider>(context, listen: false)
                    .removeFromWishlist(category);
              } else {
                Provider.of<WishlistProvider>(context, listen: false)
                    .addToWishlist(category);
              }
            },
            icon: Icon(
              Icons.favorite,
              color:
                  Provider.of<WishlistProvider>(context).isInWishlist(category)
                      ? Colors.red
                      : Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
    );
  }

  Widget _buildCategoryDescription(String description) {
    return Text(
      description,
      style: const TextStyle(color: Colors.black54),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCategoryColor(String color) {
    return Text(
      color,
      style: const TextStyle(color: Colors.red),
    );
  }

  Widget _buildCategoryPrice(String price) {
    return Text(
      price,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _buildRatingBar() {
    return RatingBar(
      itemSize: 25,
      minRating: 1,
      initialRating: 3.5,
      allowHalfRating: true,
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Colors.yellow[700]),
        half: Icon(Icons.star_half, color: Colors.yellow[700]),
        empty: const Icon(Icons.star_border, color: Colors.black),
      ),
      onRatingUpdate: (rating) {},
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      color: Colors.grey[400],
      height: 25,
      child: Row(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
