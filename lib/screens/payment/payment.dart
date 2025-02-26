import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:ecommerce_demo/screens/categories/categorymain.dart';

class paymentpage extends StatefulWidget {
  final double totalPrice;

  const paymentpage({super.key, required this.totalPrice});

  @override
  State<paymentpage> createState() => _paymentpageState();
}

class _paymentpageState extends State<paymentpage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
              onPressed: () {
                openCheckout();
              },
              child: Text('Payment'))),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Fluttertoast.showToast(msg: 'Payment Success');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => CategoryPage(),
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(msg: 'Payment Failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Fluttertoast.showToast(msg: 'Wallet not responding');
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_GeTvc3w9zhnFIn',
      'amount': (widget.totalPrice * 100).toInt(),
      'name': 'Furniture',
      'description': 'Chair',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    try {
      _razorpay.clear();
    } catch (e) {
      print(e);
    }
  }
}
