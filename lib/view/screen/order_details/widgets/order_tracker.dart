import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

class OrderTracker extends StatelessWidget {
  const OrderTracker({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return OrderTrackerZen(
      isShrinked: false,
      animation_duration: 1000,
      tracker_data: [
        TrackerData(
          title: "Order Placed",
          date: DateFormat.yMMMMd('en_US')
              .format(DateTime.parse(order.deliveryDate)),
          tracker_details: [
            TrackerDetails(
              title: "Your order was placed on",
              datetime: DateFormat.yMEd()
                  .add_jms()
                  .format(DateTime.parse(order.orderDate)),
            ),
          ],
        ),
        TrackerData(
          title: "Cooking ",
          date: DateFormat.yMMMMd('en_US')
              .format(DateTime.parse(order.deliveryDate)),
          tracker_details: [
            TrackerDetails(
              title: "Your ordered dish on cooking",
              datetime: DateFormat.yMEd()
                  .add_jms()
                  .format(DateTime.parse(order.deliveryDate)),
            ),
          ],
        ),
        TrackerData(
          title: "Food Ready ",
          date: DateFormat.yMMMMd('en_US')
              .format(DateTime.parse(order.deliveryDate)),
          tracker_details: [
            TrackerDetails(
              title: "Your ordered dish is ready now.",
              datetime: DateFormat.yMEd()
                  .add_jms()
                  .format(DateTime.parse(order.deliveryDate)),
            ),
          ],
        ),
        TrackerData(
          title: "Order Delivered",
          date: DateFormat.yMMMMd('en_US')
              .format(DateTime.parse(order.deliveryDate)),
          tracker_details: [
            TrackerDetails(
              title: "You received your order",
              datetime: DateFormat.yMEd()
                  .add_jms()
                  .format(DateTime.parse(order.deliveryDate)),
            ),
          ],
        ),
      ],
    );
  }
}
