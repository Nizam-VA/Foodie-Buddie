import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodiebuddie/controller/api_services/checkout/api_calls.dart';
import 'package:foodiebuddie/model/checkout_response.dart';
import 'package:foodiebuddie/model/verify_payment.dart';
import 'package:foodiebuddie/view/screen/main/screen_main.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key, required this.response});
  final CheckoutResponse response;
  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(
        msg: 'SUCCESS PAYMENT: ${response.paymentId}', timeInSecForIosWeb: 4);
    try {
      final payment = VerifyPayment(
        razorpayOrderId: response.orderId!,
        razorpayPaymentId: response.paymentId!,
        razorpaySignature: response.signature!,
      );
      // Call the verifyPayment method from the CheckOutApiServices
      final value = await CheckOutApiServices().verifyPayment(payment);

      // Check the response from the API and handle accordingly
      if (value) {
        // Payment verification successful, you can perform further actions if needed.
        print("Payment verification successful: ${value}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ScreenMain()),
            (route) => false);
      } else {
        // Payment verification failed, handle the failure case.
        print("Payment verification failed: ${value}");
      }
    } catch (error) {
      // Handle any exceptions that may occur during the API call.
      print("Error during payment verification: $error");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Error PAYMENT: ${response.code}', timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'Wallet PAYMENT: ${response.walletName}', timeInSecForIosWeb: 4);
  }

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
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
            print(widget.response.key);
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
            _razorpay?.open(options);
          },
        ),
      ),
    );
  }
}
