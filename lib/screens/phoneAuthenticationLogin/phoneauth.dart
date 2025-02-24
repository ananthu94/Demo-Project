import 'package:flutter/material.dart';
import 'package:ecommerce_demo/screens/homepage/homepage.dart';
import 'package:ecommerce_demo/firebase%20Auth/authservices.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();

  void handleSubmit(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      AuthService().loginWithOtp(otp: otpController.text).then((value) {
        if (value == "Success") {
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter the phone number with Contry code'),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              maxLength: 13,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'Phone number',
                  hintText: '+91**********',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.red[900],
                      minWidth: double.infinity,

                      onPressed: () async {
                        await AuthService().sentOtp(
                            phone: phoneController.text,
                            errorStep: () => ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text('Error sending otp'))),
                            nextStep: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('OTP verification'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            "6 DIGIT OTP SENT TO YOUR PHONE"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Form(
                                          key: _formkey,
                                          child: TextFormField(
                                            maxLength: 6,
                                            keyboardType: TextInputType.number,
                                            controller: otpController,
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                labelText: 'ENTER OTP',
                                                hintText: '******',
                                                hintStyle: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            validator: (value) {
                                              if (value?.length != 6) {
                                                return 'INVALID OTP';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            handleSubmit(context);
                                            // if (_formkey.currentState!
                                            //     .validate()) {
                                            //   AuthService()
                                            //       .loginWithOtp(
                                            //           otp: otpController.text)
                                            //       .then(
                                            //     (value) {
                                            //       if (value == 'Success') {
                                            //         Navigator.pop(context);
                                            //         Navigator.push(
                                            //             context,
                                            //             MaterialPageRoute(
                                            //               builder: (context) =>
                                            //                   const Homepage(),
                                            //             ));
                                            //       } else {
                                            //         ScaffoldMessenger.of(
                                            //                 context)
                                            //             .showSnackBar(
                                            //                 const SnackBar(
                                            //                     content: Text(
                                            //                         'Wrong OTP')));
                                            //       }
                                            //     },
                                            //   );
                                            // }
                                          },
                                          child: const Text('SUBMIT'))
                                    ],
                                  ),
                                ));
                      },
                      // onPressed: () async {
                      //   setState(() {
                      //     isLoading = true;
                      //   });
                      //   FirebaseAuth.instance.verifyPhoneNumber(
                      //     phoneNumber: phoneController.text,
                      //     verificationCompleted: (phoneAuthCredential) {},
                      //     verificationFailed: (error) {
                      //       log(error.toString());
                      //     },
                      //     codeSent: (verificationId, forceResendingToken) {
                      //       setState(() {
                      //         isLoading = false;
                      //       });

                      //       Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => OtpPage(
                      //           verificationId: verificationId,
                      //         ),
                      //       ));
                      //     },
                      //     codeAutoRetrievalTimeout: (verificationId) {
                      //       log('Autoretreaval,timedout');
                      //     },
                      //   );
                      // },
                      child: const Text(
                        'verify',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
