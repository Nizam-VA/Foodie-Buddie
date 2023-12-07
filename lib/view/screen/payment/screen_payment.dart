import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodiebuddie/model/checkout_response.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key, required this.response});
  final CheckoutResponse response;
  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  var razorpay = Razorpay();
  // int paymentId = 0;

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: ButtonWidget(
          width: width,
          text: 'Proceed to pay',
          onPressed: () async {
            razorpay = Razorpay();
            var options = {
              'key': widget.response.key, //test
              'amount': (widget.response.totalPrice -
                      widget.response.deliveryCharge) *
                  100, //in the smallest currency sub-unit.
              'currency': 'INR',
              'name': widget.response.firstName,
              'order_id':
                  widget.response.orderId, // Generate order_id using Orders API
              'description': 'Product Id. # 1234',
              'timeout': 60, // in seconds
              'prefill': {
                'contact': widget.response.phone,
                'email': widget.response.email
              }
            };
            razorpay.open(options);
          },
        ),
      ),
    );
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // orderId = 12123;
    // razorpayId = response.paymentId;
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId}", timeInSecForIosWeb: 4);
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) async {
  //   print('hello successful');
  //   final payment = VerifyPayment(
  //     razorpayOrderId: response.orderId!,
  //     razorpayPaymentId: response.paymentId!,
  //     razorpaySignature: response.signature!,
  //   );
  //   try {
  //     // Call the verifyPayment method from the CheckOutApiServices
  //     final value = await CheckOutApiServices().verifyPayment(payment);

  //     // Check the response from the API and handle accordingly
  //     if (value) {
  //       // Payment verification successful, you can perform further actions if needed.
  //       print("Payment verification successful: ${value}");
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => ScreenMain()),
  //           (route) => false);
  //     } else {
  //       // Payment verification failed, handle the failure case.
  //       print("Payment verification failed: ${value}");
  //     }
  //   } catch (error) {
  //     // Handle any exceptions that may occur during the API call.
  //     print("Error during payment verification: $error");
  //   }
  //   Fluttertoast.showToast(
  //       msg: "Payment Success : ${response.paymentId}",
  //       toastLength: Toast.LENGTH_SHORT,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('hello failure');
    Fluttertoast.showToast(
        msg: "Payment  Failed Try again",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('😊😊😊😊external handler');
  }
}
