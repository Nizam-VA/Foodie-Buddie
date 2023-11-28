import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/cart/widgets/item_row.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';
import 'package:foodiebuddie/view/widgets/button_widget.dart';

class ScreenPaymentMethod extends StatelessWidget {
  ScreenPaymentMethod({super.key});

  String selectedOption = '';
  List<String> values = ['COD', 'ONLINE'];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SectionHead(heading: 'Payment Details'),
            kHight10,
            Container(
              width: width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                children: [
                  ItemRow(keyString: 'Item Total', value: '₹ 250'),
                  kHight10,
                  ItemRow(keyString: 'Delivery Charge', value: 'Free'),
                  kHight10,
                  divider2,
                  ItemRow(keyString: 'Discount', value: '₹ 50'),
                  kHight10,
                  divider2,
                  ItemRow(keyString: 'Total Amount', value: '₹ 200'),
                ],
              ),
            ),
            kHight20,
            const Text(
              'Select your preferred payment method to complete the transaction seamlessly.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHight10,
            Column(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: DottedBorder(
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    color: Colors.green,
                    strokeWidth: 2,
                    dashPattern: const [5, 5],
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(
                        index == 0 ? 'Cash On Delivery' : 'Online Payment',
                        style: boldBlack,
                      ),
                      trailing: Radio(
                        value: values[index],
                        groupValue: selectedOption,
                        onChanged: (value) {
                          selectedOption = value!;
                        },
                      ),
                    ),
                  ),
                );
              }),
            ),
            kHight20,
            ButtonWidget(
              width: width,
              text: 'Proceed to pay',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
