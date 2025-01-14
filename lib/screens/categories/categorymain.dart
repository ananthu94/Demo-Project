import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/categories/tabbar/tabbarcategories.dart';

class CatogoryPage extends StatelessWidget {
  const CatogoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      suffixIcon: const Icon(Icons.search),
                      labelText: 'Search',
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(child: TabbarWidgetCategories()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
