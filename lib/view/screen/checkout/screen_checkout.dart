import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/controller/blocs/payment/payment_bloc.dart';
import 'package:foodiebuddie/model/checkout.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/cart/widgets/item_row.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class ScreenCheckout extends StatefulWidget {
  ScreenCheckout(
      {super.key, required this.couponCode, required this.addressId});
  final String couponCode;
  final int addressId;

  @override
  State<ScreenCheckout> createState() => _ScreenCheckoutState();
}

class _ScreenCheckoutState extends State<ScreenCheckout> {
  int total = 0;

  List<String> values = ['COD', 'ONLINE'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SectionHead(heading: 'Payment Details'),
            kHight10,
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is! CartInitial) {
                  state is GetAllCartItemsState
                      ? total = state.total - state.discount
                      : 0;
                  return Container(
                    width: width,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        ItemRow(
                            keyString: 'Item Total',
                            value: state is GetAllCartItemsState
                                ? '₹ ${state.total}'
                                : '₹ 0'),
                        kHight10,
                        const ItemRow(
                            keyString: 'Delivery Charge', value: 'Free'),
                        kHight10,
                        divider2,
                        ItemRow(
                            keyString: 'Discount',
                            value: state is GetAllCartItemsState
                                ? '₹ ${state.discount}'
                                : '₹ 0'),
                        kHight10,
                        divider2,
                        ItemRow(
                          keyString: 'Total Amount',
                          value: state is GetAllCartItemsState
                              ? '₹ ${state.total - state.discount}'
                              : '₹ 200',
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('No data '));
                }
              },
            ),
            kHight20,
            const Text(
              'Select your preferred payment method to complete the transaction seamlessly.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHight10,
            Column(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: DottedBorder(
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    color: Colors.green,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(
                        index == 0 ? 'Cash On Delivery' : 'Online Payment',
                        style: boldBlack,
                      ),
                      trailing: BlocBuilder<PaymentBloc, PaymentState>(
                        builder: (context, state) {
                          return Radio(
                            value: values[index],
                            groupValue: state.method,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              context
                                  .read<PaymentBloc>()
                                  .add(PaymentMethodEvent(method: value!));
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
            ),
            kHight20,
            BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                return ButtonWidget(
                  width: width,
                  text: state.method == 'COD' ? 'Checkout' : 'Proceed to pay',
                  onPressed: () async {
                    print(state.method);
                    if (state.method == 'COD') {
                      final checkOut = CheckOut(
                        addressId: widget.addressId.toString(),
                        couponCode: widget.couponCode,
                        paymentMethod: state.method,
                      );
                      context.read<CartBloc>().add(
                          CheckoutEvent(checkOut: checkOut, context: context));
                    } else if (state.method == 'ONLINE') {
                      final checkOut = CheckOut(
                        addressId: widget.addressId.toString(),
                        couponCode: widget.couponCode,
                        paymentMethod: state.method,
                      );
                      context.read<CartBloc>().add(
                          CheckoutEvent(checkOut: checkOut, context: context));
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const ScreenPayment(response: ),
                      //   ),
                      // );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
