import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce_demo/screens/categories/categorylistmap/categorydetails.dart';

class LampCategory extends StatelessWidget {
  const LampCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoryAll.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 350,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 190,
                    width: 170,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(
                          categoryAll.elementAt(index)['Pimages'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Text(
                categoryAll.elementAt(index)['title'],
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
              Text(
                categoryAll.elementAt(index)['description'],
                style: const TextStyle(color: Colors.black54),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                categoryAll.elementAt(index)['color'],
                style: const TextStyle(color: Colors.red),
              ),
              Text(
                categoryAll.elementAt(index)['price'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              RatingBar(
                  itemSize: 25,
                  minRating: 1,
                  initialRating: 3.5,
                  allowHalfRating: true,
                  ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      half: Icon(
                        Icons.star_half,
                        color: Colors.yellow[700],
                      ),
                      empty: const Icon(
                        Icons.star_border,
                        color: Colors.black,
                      )),
                  onRatingUpdate: (rating) {}),
            ],
          ),
        );
      },
    );
  }
}
