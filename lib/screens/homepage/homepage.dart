import 'package:flutter/material.dart';
import 'package:ecommerce_demo/widgets/drawer/drawer.dart';
import 'package:ecommerce_demo/screens/productpage/productpage.dart';
import 'package:ecommerce_demo/widgets/bottonnavigationbar/bottomnavbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
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
                          borderRadius: BorderRadius.circular(10))),
                ),
                const Text('Explore'),
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: Colors.blue,
                            child: const Opacity(
                              opacity: 0.5,
                              child: Image(
                                image:
                                    AssetImage('assets/images/reg_page.webp'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Glass'),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                      'sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 300, top: 310),
                            child: Container(
                              height: 30,
                              width: 60,
                              color: Colors.white,
                              child: const Center(child: Text('\$20')),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            color: Colors.blue,
                            child: const Opacity(
                              opacity: 0.5,
                              child: Image(
                                image:
                                    AssetImage('assets/images/reg_page.webp'),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Glass'),
                                SizedBox(
                                  width: 400,
                                  child: Text(
                                      'sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh sdfidshfjkdsf dsjfhdsjfldh kdsjfhsdhf sjhdfhlkdshn hjksldfldhslfk hjksdflkhdskfl dhjfklsh'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 300, top: 310),
                            child: Container(
                              height: 30,
                              width: 60,
                              color: Colors.white,
                              child: const Center(child: Text('\$20')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text('Popular Products'),
                SizedBox(
                  height: 250,
                  child: ListView(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            height: 200,
                          ),
                          Text('chair'),
                          Text('\$20'),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            height: 200,
                          ),
                          Text('chair'),
                          Text('\$20'),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            height: 200,
                          ),
                          Text('chair'),
                          Text('\$20'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text('Popular Products'),
                SizedBox(
                  height: 250,
                  child: ListView(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            height: 200,
                          ),
                          Text('chair'),
                          Text('\$20'),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            height: 200,
                          ),
                          Text('chair'),
                          Text('\$20'),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/landingScreen2.jpg'),
                            height: 200,
                          ),
                          Text('chair'),
                          Text('\$20'),
                        ],
                      ),
                    ],
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
