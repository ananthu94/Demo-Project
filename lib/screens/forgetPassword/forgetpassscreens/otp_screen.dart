// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// class OtpScreen extends StatelessWidget {
//   const OtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Image(
//             image: AssetImage('assets/images/verify alert.png'),
//           ),
//           Text(
//             'VERIFICATION',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red[900],
//                 fontSize: 40),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Text('Enter the verification code'),
//           const SizedBox(
//             height: 10,
//           ),
//           OtpTextField(
//             numberOfFields: 6,
//             filled: true,
//             fillColor: Colors.grey.withOpacity(0.2),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//               width: MediaQuery.of(context).size.width * .9,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red[900],
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 onPressed: () {},
//                 child: const Text(
//                   'Verify',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
