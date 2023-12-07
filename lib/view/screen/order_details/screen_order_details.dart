import 'package:flutter/material.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenOrderDetails extends StatelessWidget {
  const ScreenOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'orderId:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hey Nizam', style: bigBoldBlack),
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHead(heading: 'Order Details'),
                  kHight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Id: ',
                        style: regularBlack,
                      ),
                      Text(
                        'OrderId',
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
                        'Dec 15 2023',
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
                        '₹ 1779.00',
                        style: semiBoldGreen,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  divider1,
                  kHight10,
                  const SectionHead(heading: 'Delivery Address'),
                  kHight10,
                  const Text(
                    'Name:\nHouse Name: \nPincode:\n',
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHead(heading: 'Order Items'),
                  divider1,
                  kHight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Item name:  '),
                      const Text(
                        'Item count',
                        style: semiBoldBlack,
                      ),
                      const Text(
                        'Price',
                        style: semiBoldBlack,
                      )
                    ],
                  ),
                  kHight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Item name:  '),
                      const Text(
                        'Item count',
                        style: semiBoldBlack,
                      ),
                      const Text(
                        'Price',
                        style: semiBoldBlack,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
