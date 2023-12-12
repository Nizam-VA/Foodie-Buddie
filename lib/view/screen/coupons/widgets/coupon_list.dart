import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/model/coupon.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';

class CouponList extends StatelessWidget {
  const CouponList(
      {super.key,
      required this.height,
      required this.width,
      required this.coupons});

  final double height;
  final double width;
  final List<Coupon> coupons;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return coupons.isEmpty
            ? const Center(child: Text('No coupons available'))
            : Container(
                width: height,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    const SectionHead(
                        heading:
                            'Unlock the value of your Gift Coupon by redeeming it here!'),
                    kHight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Expires '),
                            SectionHead(
                                heading:
                                    coupons[index].endDate.substring(0, 10)),
                            kHight10,
                            Container(
                              alignment: Alignment.center,
                              width: width * .3,
                              height: height * .05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: Text(
                                '₹ ${coupons[index].discount}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            context.read<CartBloc>().add(
                                  RedeemCouponEvent(
                                    coupon: coupons[index],
                                  ),
                                );
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width * .4,
                            height: height * .05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green)),
                            child: const Text(
                              'Redeem Now',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
      },
      itemCount: coupons.length,
    );
  }
}
