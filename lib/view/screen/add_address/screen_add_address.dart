import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/address/address_bloc.dart';
import 'package:foodiebuddie/model/address.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';
import 'package:foodiebuddie/view/widgets/text_field_widget.dart';

enum Operation { add, edit }

class ScreenAddAddress extends StatefulWidget {
  ScreenAddAddress({super.key, required this.operation, this.address});
  final Operation operation;
  Address? address;

  @override
  State<ScreenAddAddress> createState() => _ScreenAddAddressState();
}

class _ScreenAddAddressState extends State<ScreenAddAddress> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final houseNameController = TextEditingController();
  final streetController = TextEditingController();
  final pinodeController = TextEditingController();
  final mobileController = TextEditingController();
  final districtController = TextEditingController();
  initControllers() {
    if (widget.address != null) {
      nameController.text = widget.address!.name;
      houseNameController.text = widget.address!.houseName;
      streetController.text = widget.address!.street;
      pinodeController.text = widget.address!.pinCode;
      mobileController.text = widget.address!.phone;
      districtController.text = widget.address!.district;
    }
  }

  @override
  void initState() {
    if (widget.operation == Operation.edit) {
      initControllers();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(
          title: widget.operation == Operation.add
              ? 'Add New Address'
              : 'Update Address',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFieldWidget(
                  userController: nameController,
                  label: 'Name:',
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the name';
                    }
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: houseNameController,
                  label: 'House Name:',
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the house name';
                    }
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: streetController,
                  label: 'Street:',
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the street name';
                    }
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: pinodeController,
                  label: 'Pin code:',
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the Pin code';
                    }
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: mobileController,
                  label: 'Mobile Number:',
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the Mobile Number';
                    }
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: districtController,
                  label: 'District:',
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the district name';
                    }
                  },
                ),
                kHight20,
                ButtonWidget(
                  width: width,
                  text: widget.operation == Operation.add ? 'Submit' : 'Update',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final addresss = Address(
                        addressId: widget.operation == Operation.add
                            ? 0
                            : widget.address!.addressId,
                        userId: 0,
                        district: districtController.text,
                        houseName: houseNameController.text,
                        name: nameController.text,
                        phone: mobileController.text,
                        pinCode: pinodeController.text,
                        street: streetController.text,
                      );
                      if (widget.operation == Operation.add) {
                        context.read<AddressBloc>().add(AddAddressEvent(
                            address: addresss, context: context));
                      } else {
                        context.read<AddressBloc>().add(UpdateAddressEvent(
                            address: addresss, context: context));
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
