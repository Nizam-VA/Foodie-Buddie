import 'package:flutter/material.dart';
import 'package:foodiebuddie/view/screen/add_address/screen_add_address.dart';
import 'package:foodiebuddie/view/widgets/dotted_button.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ScreenAddAddress(operation: Operation.add),
          ),
        );
      },
      child: DottedButtonWidget(
        width: width,
        height: height,
        title: 'Add New Address',
        icon: Icons.add,
      ),
    );
  }
}
