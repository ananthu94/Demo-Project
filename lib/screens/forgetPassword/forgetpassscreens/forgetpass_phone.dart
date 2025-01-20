// import 'package:flutter/material.dart';
// import 'package:ecommerce_demo/screens/forgetPassword/forgetpassscreens/otp_screen.dart';

// class ForgetpassPhone extends StatelessWidget {
//   const ForgetpassPhone({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 100,
//               ),
//               const SizedBox(
//                   height: 200,
//                   child: Image(
//                       image: AssetImage('assets/images/forget_pass.jpg'))),
//               const Text(
//                 'Forget Password',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     prefixIcon: const Icon(Icons.phone_android_sharp),
//                     hintText: 'Phone Number',
//                     labelText: 'Phone Number'),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               MaterialButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const OtpScreen(),
//                   ));
//                 },
//                 color: Colors.red[900],
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 minWidth: double.infinity,
//                 child: const Text('NEXT'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
