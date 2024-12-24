import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/forgetPassword/forgetpassscreens/forgetpass_mail.dart';
import 'package:ecommerce_demo/screens/forgetPassword/forgetpassscreens/forgetpass_phone.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      color: Colors.red[900],
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Reset Password!',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          const Text(
            'Select one of the options given below to reset password',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ForgetpassMail(),
              ));
            },
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'E-Mail',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text('Reset via E-mail verification')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ForgetpassPhone(),
              ));
            },
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_android_sharp,
                    size: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Phone',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text('Reset via Phone verification')
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
