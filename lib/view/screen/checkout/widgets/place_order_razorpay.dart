import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PlaceOrderWithRazorpay extends StatefulWidget {
  const PlaceOrderWithRazorpay({
    super.key,
  });

  @override
  State<PlaceOrderWithRazorpay> createState() => _PlaceOrderWithRazorpayState();
}

class _PlaceOrderWithRazorpayState extends State<PlaceOrderWithRazorpay> {
  late Razorpay razorpay;
  int paymentId = 0;

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              var options = {
                'method': {
                  'netbanking': true,
                  'card': true,
                  'upi': true,
                  'wallet': true,
                },
                'key': 'rzp_test_JdQ71Ts0del2wT',
                'amount': state is GetAllCartItemsState
                    ? (state.total - state.discount) * 100
                    : 0, //in the smallest currency sub-unit.
                'name': 'user',
                // 'order_id': createdOrder.data['id'], // Generate order_id using Orders API
                // 'order_id': DateTime.now()
                //     .microsecondsSinceEpoch, // Generate order_id using Orders API
                'description': 'razorpay restaurant',
                "entity": "order",
                "currency": "INR",
                "status": "created",
                "notes": [],
                'timeout': 60, // in seconds
                'prefill': {'contact': '9895123545', 'email': 'user@gmail.com'}
              };
              // paymentId = state.selectedPaymentmethod!.id!;
              razorpay.open(options);
            },
            child: const Text('Place oreder'),
          );
        },
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Success : ${response.paymentId}",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    // context.read<OrderBloc>().add(OrderEvent.placeOrder(
    //     placeOrderModel: PlaceOrderModel(
    //         addressId: context.read<UserBloc>().defaultAddress!.id!,
    //         couponId: context.read<CartBloc>().usedCouponId,
    //         paymentId: paymentId)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment  Failed Tryagain",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('external handler');
  }
}
