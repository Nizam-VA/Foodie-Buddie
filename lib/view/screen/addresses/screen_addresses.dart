import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/address/address_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/add_address/screen_add_address.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class ScreenAddresses extends StatelessWidget {
  const ScreenAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                        onLongPress: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          width: width,
                          // height: height * .2,
                          decoration: BoxDecoration(
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
                                          heading: state.addresses[index].name),
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
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  dashPattern: const [5, 5],
                  color: Colors.green,
                  strokeWidth: 1.5,
                  child: SizedBox(
                    width: width,
                    height: height * .13,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 30, color: Colors.red),
                        Text('Add new address')
                      ],
                    ),
                  ),
                ),
              ),
              kHight30,
              ButtonWidget(
                width: width * 1.2,
                text: 'Confirm Location',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
