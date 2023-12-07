import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/address/address_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/add_address/screen_add_address.dart';
import 'package:foodiebuddie/view/screen/checkout/screen_checkout.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/dotted_button.dart';

class ScreenAddresses extends StatelessWidget {
  const ScreenAddresses({super.key, this.couponCode});
  final String? couponCode;
  final int addressId = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    int selectedIndex = 0;
    context.read<AddressBloc>().add(GetAllAddressEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<AddressBloc>()
                              .add(SelectAddressEvent(index: index));
                        },
                        child: BlocBuilder<AddressBloc, AddressState>(
                          builder: (context, state) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.all(12),
                              width: width,
                              // height: height * .2,
                              decoration: BoxDecoration(
                                color: state.index == index
                                    ? Colors.grey[300]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined,
                                              size: 24, color: Colors.red),
                                          SectionHead(
                                              heading:
                                                  state.addresses[index].name),
                                        ],
                                      ),
                                      ButtonWidget(
                                        width: width * .4,
                                        text: 'Change',
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenAddAddress(
                                                operation: Operation.edit,
                                                address: state.addresses[index],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  kHight10,
                                  Text(
                                    '${state.addresses[index].houseName},  ${state.addresses[index].street},  ${state.addresses[index].pinCode},  ${state.addresses[index].district},  ${state.addresses[index].state}, ${state.addresses[index].phone}',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                    itemCount: state.addresses.length,
                  );
                },
              ),
              kHight10,
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ScreenAddAddress(operation: Operation.add),
                    ),
                  );
                },
                child: DottedButtonWidget(
                  width: width,
                  height: height,
                  title: 'Add New Address',
                  icon: Icons.add,
                ),
              ),
              kHight30,
              BlocBuilder<AddressBloc, AddressState>(
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
                              addressId:
                                  state.addresses[state.index!].addressId),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
