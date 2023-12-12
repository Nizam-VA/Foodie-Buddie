import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/address.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails(
      {super.key,
      required this.width,
      required this.order,
      required this.address});

  final double width;
  final Order order;
  final Address address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
    );
  }
}
