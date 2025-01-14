import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';
import 'package:ecommerce_demo/screens/signup/signup_page.dart';
import 'package:ecommerce_demo/screens/mainscreen/mainscreen.dart';
import 'package:ecommerce_demo/screens/forgetPassword/forgetpassmain.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  bool showpass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Image(
              image: AssetImage('assets/images/L7 logo.png'),
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
                        'Login',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => const ForgetPass(),
                            );
                          },
                          child: const Text('Forget Password !')),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.red[900],
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Center(child: Text('OR')),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/GoogleLogo.png'),
                            width: 20,
                          ),
                          Text(' Signin With Google')
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ));
                        },
                        child: Text.rich(TextSpan(
                            text: "Don't have an account ? ",
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: 'SignUp',
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
