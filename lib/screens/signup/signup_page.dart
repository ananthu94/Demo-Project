import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';
import 'package:ecommerce_demo/firebase%20Auth/authservices.dart';
import 'package:ecommerce_demo/screens/emailvalidator/emailvalidator.dart';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var formkey = GlobalKey<FormState>();
  bool showpass = false;

  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Image(
              image: AssetImage('assets/images/reg_page.webp'),
              height: 200,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[300],
                child: ListView(
                  children: [
                    const Center(
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Name Input
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Email Input
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: validateEmail,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Password Input
                    TextFormField(
                      controller: _password,
                      obscureText: !showpass,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.fingerprint),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showpass = !showpass;
                                });
                              },
                              icon: Icon(showpass == false
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }

                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Confirm Password Input
                    TextFormField(
                      controller: _confirmpassword,
                      obscureText: !showpass,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.fingerprint),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showpass = !showpass;
                                });
                              },
                              icon: Icon(showpass == false
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          labelText: 'Confirm Password',
                          hintText: 'Enter Password Again',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (value != _password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Submit Button
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.red[900],
                      minWidth: double.infinity,
                      onPressed: _signup,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Login Button
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                        },
                        child: Text.rich(TextSpan(
                            text: 'Already have an account ? ',
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(color: Colors.red[900]))
                            ]))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  gotoHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  _signup() async {
    if (formkey.currentState?.validate() ?? false) {
      try {
        final user = await _auth.createUserWithEmailAndPassword(
            _email.text, _password.text);

        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign In Successful!')),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'This email is already in use. Please use a different email.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${e.message}')),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly.')),
      );
    }
  }
}
