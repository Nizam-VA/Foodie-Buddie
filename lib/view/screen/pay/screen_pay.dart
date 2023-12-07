import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ScreenPay extends StatefulWidget {
  const ScreenPay({super.key});

  @override
  State<ScreenPay> createState() => _ScreenPayState();
}

class _ScreenPayState extends State<ScreenPay> {
  var _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: ButtonWidget(
          width: width,
          text: 'Proceed to Pay',
          onPressed: () {
            var options = {
              'key': 'rzp_test_FV4AbXsCYMqPcC', //test
              'amount': 50000, //in the smallest currency sub-unit.
              'currency': 'INR',
              'name': 'Actofit',
              'order_id':
                  'Product Id. # 1234', // Generate order_id using Orders API
              'description': 'Product Id. # 1234',
              'timeout': 60, // in seconds
              'prefill': {'contact': '', 'email': 'actofit@yopmail.comm'}
            };
            try {
              _razorpay.open(options);
            } catch (e) {
              debugPrint(e as String?);
            }
          },
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment fails
    print("Payment Successful");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("Payment Successful");
  }
}
