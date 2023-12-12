import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/addresses/screen_addresses.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.width,
    required this.couponCode,
  });

  final double width;
  final String couponCode;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      width: width * 1.3,
      text: 'Add or select address',
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ScreenAddresses(couponCode: couponCode),
          ),
        );
      },
    );
  }
}
