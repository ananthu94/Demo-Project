import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var formkey = GlobalKey<FormState>();
  bool showpass = false;

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
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      // validator: (email) {
                      //   if (email!.isNotEmpty &&
                      //       email.contains('@') &&
                      //       email.contains('.com')) {
                      //     return null;
                      //   } else {
                      //     return 'Enter valid Email ID';
                      //   }
                      // },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
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
                          hintText: 'Enter Password',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.red[900],
                      minWidth: double.infinity,
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
}
