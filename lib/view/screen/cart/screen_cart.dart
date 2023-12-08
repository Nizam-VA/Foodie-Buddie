import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/controller/blocs/restaurant/restaurant_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/addresses/screen_addresses.dart';
import 'package:foodiebuddie/view/screen/cart/widgets/item_row.dart';
import 'package:foodiebuddie/view/screen/coupons/screen_coupons.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/screen/main/screen_main.dart';
import 'package:foodiebuddie/view/screen/restaurant_dishes/screen_restaurant_dishes.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:input_quantity/input_quantity.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({super.key});

  final List<int> tips = [20, 30, 50];
  int selectedTip = 0;
  int total = 0;
  String couponCode = '';
  int sellerId = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CartBloc>().add(GetAllCartItemsEvent());
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state is GetAllCartItemsState
              ? state.cartItems.isEmpty
                  ? Center(
                      child: Image.asset('assets/images/icons/empty-cart.gif'),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(18),
                              width: width,
                              // height: height * .65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      return state is GetAllCartItemsState &&
                                              state.cartItems.isEmpty
                                          ? const Center(
                                              child: Text('Cart is empty.'),
                                            )
                                          : ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                sellerId = state
                                                        is GetAllCartItemsState
                                                    ? state.cartItems[index]
                                                        .sellerId
                                                    : 0;
                                                print(sellerId);
                                                return SizedBox(
                                                  height: height * .075,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SectionHead(
                                                            heading: state
                                                                    is GetAllCartItemsState
                                                                ? state
                                                                    .cartItems[
                                                                        index]
                                                                    .name
                                                                : 'Dish name',
                                                          ),
                                                          state is GetAllCartItemsState
                                                              ? SectionHead(
                                                                  heading:
                                                                      '₹ ${state.cartItems[index].price * state.cartItems[index].quantity}')
                                                              : const Text(
                                                                  'Price')
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InputQty(
                                                            decoration:
                                                                const QtyDecorationProps(
                                                                    border:
                                                                        InputBorder
                                                                            .none),
                                                            initVal: state
                                                                    is GetAllCartItemsState
                                                                ? state
                                                                    .cartItems[
                                                                        index]
                                                                    .quantity
                                                                : 0,
                                                            onQtyChanged:
                                                                (value) async {
                                                              state is GetAllCartItemsState &&
                                                                      value >
                                                                          state
                                                                              .cartItems[
                                                                                  index]
                                                                              .quantity
                                                                  ? context.read<CartBloc>().add(AddToCartEvent(
                                                                      dishId: state
                                                                          .cartItems[
                                                                              index]
                                                                          .dishId,
                                                                      context:
                                                                          context))
                                                                  : state is GetAllCartItemsState &&
                                                                          value <
                                                                              state
                                                                                  .cartItems[
                                                                                      index]
                                                                                  .quantity
                                                                      ? context
                                                                          .read<
                                                                              CartBloc>()
                                                                          .add(DecreaseCartEvent(
                                                                              dishId: state.cartItems[index].dishId,
                                                                              context: context))
                                                                      : null;
                                                            },
                                                            qtyFormProps:
                                                                const QtyFormProps(
                                                                    enableTyping:
                                                                        false),
                                                          ),
                                                          IconButton(
                                                              onPressed:
                                                                  () async {
                                                                state is GetAllCartItemsState
                                                                    ? context.read<CartBloc>().add(DeleteItemFromCartEvent(
                                                                        dishId: state
                                                                            .cartItems[
                                                                                index]
                                                                            .dishId,
                                                                        context:
                                                                            context))
                                                                    : null;
                                                              },
                                                              icon: const Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return divider1g;
                                              },
                                              itemCount:
                                                  state is GetAllCartItemsState
                                                      ? state.cartItems.length
                                                      : 0,
                                            );
                                    },
                                  ),
                                  kHight10,
                                  divider2,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SectionHead(
                                          heading: 'Add more items'),
                                      BlocBuilder<RestaurantBloc,
                                          RestaurantState>(
                                        builder: (context, state) {
                                          return IconButton(
                                              onPressed: () {
                                                if (sellerId != 0) {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScreenRestaurantDishes(
                                                        seller: state
                                                            .restaurants
                                                            .firstWhere(
                                                                (element) =>
                                                                    element
                                                                        .id ==
                                                                    sellerId),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScreenMain(),
                                                    ),
                                                  );
                                                }
                                              },
                                              icon: const Icon(
                                                  CupertinoIcons.add_circled));
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            kHight20,
                            const SectionHead(heading: 'Apply Coupon'),
                            kHight10,
                            Container(
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
                            ),
                            kHight20,
                            const SectionHead(heading: 'Bill Details'),
                            kHight10,
                            Container(
                              width: width,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      return ItemRow(
                                        keyString: 'Item Total: ',
                                        value: state is GetAllCartItemsState
                                            ? '₹ ${state.total}'
                                            : '₹ 0',
                                      );
                                    },
                                  ),
                                  kHight10,
                                  const ItemRow(
                                      keyString: 'Delivery fee', value: 'free'),
                                  kHight10,
                                  divider1,
                                  BlocBuilder<CartBloc, CartState>(
                                    buildWhen: (previous, current) =>
                                        current is! CartInitial,
                                    builder: (context, state) {
                                      if (state is GetAllCartItemsState) {
                                        return ItemRow(
                                            keyString: 'Discount',
                                            value: '₹ ${state.discount}');
                                      }
                                      return const ItemRow(
                                          keyString: 'Discount', value: '₹ 0');
                                    },
                                  ),
                                  kHight10,
                                  divider1,
                                  kHight10,
                                  BlocBuilder<CartBloc, CartState>(
                                    buildWhen: (previous, current) =>
                                        current is! CartInitial,
                                    builder: (context, state) {
                                      state is GetAllCartItemsState
                                          ? couponCode = state.couponCode
                                          : '';
                                      return ItemRow(
                                        keyString: 'Total Amount: ',
                                        value: state is GetAllCartItemsState
                                            ? '₹ ${state.total - state.discount}'
                                            : state is GetAllCartItemsState
                                                ? '₹ ${state.total}'
                                                : '₹ 0',
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            kHight20,
                            Container(
                              width: width,
                              height: height * .2,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 30,
                                        color: Colors.red[700],
                                      ),
                                      const SectionHead(
                                          heading:
                                              'Where would you like us to deliver\n this order?')
                                    ],
                                  ),
                                  kHight10,
                                  ButtonWidget(
                                    width: width * 1.3,
                                    text: 'Add or select address',
                                    onPressed: () async {
                                      print(couponCode);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ScreenAddresses(
                                              couponCode: couponCode),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
              : kHight10;
        },
      ),
    );
  }
}
