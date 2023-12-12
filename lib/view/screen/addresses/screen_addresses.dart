import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/address/address_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/addresses/widgets/add_new_address_button.dart';
import 'package:foodiebuddie/view/screen/addresses/widgets/address_list.dart';
import 'package:foodiebuddie/view/screen/addresses/widgets/confirmation_button.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenAddresses extends StatelessWidget {
  const ScreenAddresses({super.key, this.couponCode});
  final String? couponCode;
  final int addressId = 0;
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
                  return AddressList(
                    width: width,
                    length: state.addresses.length,
                  );
                },
              ),
              kHight10,
              AddNewAddressButton(width: width, height: height),
              kHight30,
              ConfirmationButton(width: width, couponCode: couponCode)
            ],
          ),
        ),
      ),
    );
  }
}
