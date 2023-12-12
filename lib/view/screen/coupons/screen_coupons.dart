import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/view/screen/coupons/widgets/coupon_list.dart';
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
              return state.coupons.isEmpty
                  ? Center(child: Image.asset('assets/images/icons/empty.gif'))
                  : CouponList(
                      height: height, width: width, coupons: state.coupons);
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
