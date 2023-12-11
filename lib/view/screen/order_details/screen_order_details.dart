import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/order/order_bloc.dart';
import 'package:foodiebuddie/controller/blocs/profile/profile_bloc.dart';
import 'package:foodiebuddie/model/address.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/screen/order_details/widgets/order_tracker.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:intl/intl.dart';

class ScreenOrderDetails extends StatelessWidget {
  ScreenOrderDetails({super.key, required this.order, required this.address});
  final Order order;
  final Address address;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<ProfileBloc>().add(GetProfileEvent());
    context.read<OrderBloc>().add(GetOrderByIdEvent(orderId: order.orderId));
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: order.orderId.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Text('Hey ${state.profile?.firstName}',
                      style: bigBoldBlack);
                },
              ),
              kHight10,
              const Text(
                'Thank you for your order! We will keep you updated on its arrival.',
                style: semiBoldGrey,
              ),
              kHight10,
              Container(
                width: width,
                // height: height * .25,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHead(heading: 'Order Details'),
                    kHight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Order Id: ',
                          style: regularBlack,
                        ),
                        Text(
                          order.orderId.toString(),
                          style: semiBoldGreen,
                        )
                      ],
                    ),
                    kHight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Order Date: ',
                          style: regularBlack,
                        ),
                        Text(
                          DateFormat.yMMMMd('en_US')
                              .format(DateTime.parse(order.orderDate)),
                          style: semiBoldGreen,
                        )
                      ],
                    ),
                    kHight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery Date: ',
                          style: regularBlack,
                        ),
                        Text(
                          DateFormat.yMMMMd('en_US')
                              .format(DateTime.parse(order.deliveryDate)),
                          style: semiBoldGreen,
                        )
                      ],
                    ),
                    kHight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total: ',
                          style: regularBlack,
                        ),
                        Text(
                          '${order.totalPrice - order.deliveryCharge}',
                          style: semiBoldGreen,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    divider1,
                    kHight10,
                    const SectionHead(heading: 'Delivery Address'),
                    kHight10,
                    Text(
                      '${address.name}\n${address.houseName} \n${address.pinCode}(PIN), ${address.street}, ${address.district}',
                      style: semiBoldBlack,
                    ),
                  ],
                ),
              ),
              kHight20,
              Container(
                width: width,
                // height: height * .25,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHead(heading: 'Order Items'),
                        divider1,
                        BlocBuilder<OrderBloc, OrderState>(
                          builder: (context, state) {
                            return Column(
                              children: List.generate(state.orderItems.length,
                                  (index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${state.orderItems[index].name}:  '),
                                    Text(
                                      'X ${state.orderItems[index].quantity}',
                                      style: semiBoldBlack,
                                    ),
                                    Text(
                                      state.orderItems[index].price.toString(),
                                      style: semiBoldBlack,
                                    )
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              kHight20,
              const SectionHead(heading: 'Order Status'),
              kHight10,
              OrderTracker(order: order)
            ],
          ),
        ),
      ),
    );
  }
}
