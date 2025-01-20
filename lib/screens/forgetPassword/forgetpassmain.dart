import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/login/login_page.dart';
import 'package:ecommerce_demo/firebase%20Auth/authservices.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _auth = AuthService();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter the email id to reset password'),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.email),
                labelText: 'Enter Email',
                hintText: 'Email',
                hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.red[900],
              minWidth: double.infinity,
              onPressed: () async {
                _auth.sendResetPasswordLink(emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Reset password link is send to the corresponding EMAIL')));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              child: const Text(
                'verify',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
