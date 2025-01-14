import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/categories/categoryscreens/allcategory.dart';
import 'package:ecommerce_demo/screens/categories/categoryscreens/lampcategory.dart';
import 'package:ecommerce_demo/screens/categories/categoryscreens/vasecategory.dart';
import 'package:ecommerce_demo/screens/categories/categoryscreens/chaircategory.dart';
import 'package:ecommerce_demo/screens/categories/categoryscreens/shelfcategory.dart';

class TabbarWidgetCategories extends StatelessWidget {
  const TabbarWidgetCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TabBar(tabs: [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Chair',
          ),
          Tab(
            text: 'Lamp',
          ),
          Tab(
            text: 'Vase',
          ),
          Tab(
            text: 'Shelf',
          ),
        ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * .73,
          width: double.infinity,
          child: const TabBarView(children: [
            AllCategory(),
            ChairCategory(),
            LampCategory(),
            VaseCategory(),
            ShelfCategory()
          ]),
        )
      ],
    );
  }
}
