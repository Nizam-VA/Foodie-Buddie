import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/coupons/screen_coupons.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class ApplyCouponContainer extends StatelessWidget {
  const ApplyCouponContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Earn cashback on your order.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          ButtonWidget(
            width: width * 1.5,
            text: 'Apply Coupon',
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScreenCoupons(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
