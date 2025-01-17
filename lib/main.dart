import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_demo/screens/landing/landingpagemain.dart';
import 'package:ecommerce_demo/screens/staylogged%20in/stayloggedin.dart';
import 'package:ecommerce_demo/statemanagement/cartProvider/cartprovider.dart';
import 'package:ecommerce_demo/statemanagement/WishlistProvider/wishlistprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      // home: const LandingPage(),
      home: FutureBuilder(
        future: checkIfFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data == true) {
            return const LandingPage();
          } else {
            return const StayLoggedIn();

            // return const LoginPage();
          }
        },
      ),
    );
  }

  Future<bool> checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isFirstTime');
    if (isFirstTime == null || isFirstTime == true) {
      prefs.setBool('isFirstTime', false);
      return true;
    } else {
      return false;
    }
  }
}
