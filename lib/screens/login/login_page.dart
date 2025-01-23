import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/signup/signup_page.dart';
import 'package:ecommerce_demo/firebase%20Auth/authservices.dart';
import 'package:ecommerce_demo/screens/forgetPassword/forgetpassmain.dart';
import 'package:ecommerce_demo/screens/phoneAuthenticationLogin/phoneauth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  bool showpass = false;
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _auth = AuthService();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              const Image(
                image: AssetImage('assets/images/L7 logo.png'),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey[200],
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const PhoneAuth();
                                  },
                                ));
                              },
                              child: const Text('Login via Phone Number')),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ForgetPass(),
                                    ));
                              },
                              child: const Text('Forget Password !')),
                        ],
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.red[900],
                        minWidth: double.infinity,
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Center(child: Text('OR')),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : OutlinedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await _auth.loginWithGoogle();
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/images/GoogleLogo.png'),
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(' Signin With Google'),
                                    ],
                                  )
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
      ),
    );
  }

  login() async {
    // final user =
    await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);
    // if (user != null) {
    //   log("user logged in");
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) {
    //     return const HomePage();
    // },
    // ));
    // }
  }
}
