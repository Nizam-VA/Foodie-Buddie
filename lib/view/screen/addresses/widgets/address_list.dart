import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/address/address_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/add_address/screen_add_address.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key, required this.width, required this.length});

  final double width;
  final int length;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.read<AddressBloc>().add(SelectAddressEvent(index: index));
          },
          child: BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(12),
                width: width,
                // height: height * .2,
                decoration: BoxDecoration(
                  color: state.index == index ? Colors.grey[300] : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                size: 24, color: Colors.red),
                            SectionHead(heading: state.addresses[index].name),
                          ],
                        ),
                        ButtonWidget(
                          width: width * .4,
                          text: 'Change',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScreenAddAddress(
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
      itemCount: length,
    );
  }
}
