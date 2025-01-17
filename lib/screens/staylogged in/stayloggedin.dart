import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';

class StayLoggedIn extends StatelessWidget {
  const StayLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            if (snapshot.data == null) {
              return const LoginPage();
            } else {
              return const HomePage();
            }
          }
        },
      ),
    );
  }
}
