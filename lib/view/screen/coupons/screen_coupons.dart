import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenCoupons extends StatelessWidget {
  const ScreenCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CartBloc>().add(GetAvailableCouponsEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Coupons Fun!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) => current is GetAllCouponsState,
          builder: (context, state) {
            if (state is GetAllCouponsState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return state.coupons.isEmpty
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Expires '),
                                      SectionHead(
                                          heading: state.coupons[index].endDate
                                              .substring(0, 10)),
                                      kHight10,
                                      Container(
                                        alignment: Alignment.center,
                                        width: width * .3,
                                        height: height * .05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.green,
                                        ),
                                        child: Text(
                                          '₹ ${state.coupons[index].discount}',
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
                                              coupon: state.coupons[index],
                                            ),
                                          );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: width * .4,
                                      height: height * .05,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.green)),
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
                itemCount: state.coupons.length,
              );
            } else {
              return const Center(
                child: Text('No data'),
              );
            }
          },
        ),
      ),
    );
  }
}
