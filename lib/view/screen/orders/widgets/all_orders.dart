import 'package:flutter/material.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/utils/text_styles.dart';
import 'package:foodiebuddie/view/screen/cart/widgets/item_row.dart';

class AllOrders extends StatelessWidget {
  const AllOrders(
      {super.key,
      required this.count,
      required this.orderId,
      required this.itemCount,
      required this.orderDate,
      required this.price,
      required this.orderStatus});
  final int count;
  final List<String> orderId;
  final List<String> itemCount;
  final List<String> orderDate;
  final List<String> price;
  final List<String> orderStatus;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            height: height * .25,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green),
            ),
            child: Column(
              children: [
                kHight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width * .14,
                      height: height * .08,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/icons/check-mark.png',
                        color: Colors.green[900],
                      ),
                    ),
                    kWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Order Id: '),
                            SizedBox(
                              width: width * .35,
                              child: Text(
                                orderId[index],
                                overflow: TextOverflow.ellipsis,
                                style: semiBoldBlack,
                              ),
                            ),
                            Text(' - ${itemCount[index]} items')
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text('Order on: '),
                            Text(
                              orderDate[index],
                              style: semiBoldBlack,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                kHight10,
                ItemRow(keyString: 'Price', value: '₹ ${price[index]}'),
                divider1,
                ItemRow(keyString: 'Order status', value: orderStatus[index])
              ],
            ),
          );
        },
      ),
    );
  }
}
