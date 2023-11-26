import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/api_services/cart/api_calls.dart';
import 'package:foodiebuddie/controller/blocs/cart/cart_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/addresses/screen_addresses.dart';
import 'package:foodiebuddie/view/screen/cart/widgets/item_row.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:input_quantity/input_quantity.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

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
      body: SingleChildScrollView(
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
                            ? const Center(child: Text('Cart is empty.'))
                            : ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: height * .075,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SectionHead(
                                          heading: state is GetAllCartItemsState
                                              ? state.cartItems[index].name
                                              : 'Dish name',
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InputQty(
                                              decoration:
                                                  const QtyDecorationProps(
                                                      border: InputBorder.none),
                                              initVal:
                                                  state is GetAllCartItemsState
                                                      ? state.cartItems[index]
                                                          .quantity
                                                      : 0,
                                              onQtyChanged: (value) async {
                                                state is GetAllCartItemsState
                                                    ? await CartApiServices()
                                                        .deleteFromCart(state
                                                            .cartItems[index]
                                                            .dishId)
                                                    : null;
                                              },
                                              qtyFormProps: const QtyFormProps(
                                                  enableTyping: false),
                                            ),
                                            state is GetAllCartItemsState
                                                ? SectionHead(
                                                    heading:
                                                        '₹ ${state.cartItems[index].price * state.cartItems[index].quantity}')
                                                : const Text('Price'),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return divider1g;
                                },
                                itemCount: state is GetAllCartItemsState
                                    ? state.cartItems.length
                                    : 0,
                              );
                      },
                    ),
                    kHight10,
                    divider2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHead(heading: 'Add more items'),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.add_circled))
                      ],
                    )
                  ],
                ),
              ),
              kHight20,
              const SectionHead(heading: 'Tip your delivery partner'),
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
                  children: [
                    const Text(
                      'Thank your delivery partner by leaving the a tip.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const SectionHead(heading: '₹ 20'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const SectionHead(heading: '₹ 30'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const SectionHead(heading: '₹ 50'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              kHight20,
              const SectionHead(heading: 'Bill Details'),
              kHight10,
              Container(
                width: width,
                height: height * .4,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    ItemRow(keyString: 'Item Total: ', value: '₹ 234.7'),
                    kHight10,
                    ItemRow(keyString: 'Delivery fee', value: 'free'),
                    kHight10,
                    divider1,
                    kHight10,
                    ItemRow(keyString: 'Delivery Tip:', value: '₹0'),
                    kHight10,
                    ItemRow(keyString: 'GST and Charges', value: '₹22'),
                    kHight10,
                    divider1,
                    kHight10,
                    ItemRow(keyString: 'To Pay', value: '₹256.7')
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScreenAddresses(),
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
      ),
    );
  }
}
