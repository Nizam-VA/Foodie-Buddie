import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/address/address_bloc.dart';
import 'package:foodiebuddie/view/screen/checkout/screen_checkout.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    super.key,
    required this.width,
    required this.couponCode,
  });

  final double width;
  final String? couponCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return ButtonWidget(
          width: width * 1.2,
          text: 'Confirm Location',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenCheckout(
                    couponCode: couponCode!,
                    addressId: state.addresses[state.index!].addressId),
              ),
            );
          },
        );
      },
    );
  }
}
