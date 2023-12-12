import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';

class OrderTracker extends StatelessWidget {
  OrderTracker({
    super.key,
    required this.order,
  });

  final Order order;

  List<TrackerData> getTrackerData() {
    final trackerData = [
      TrackerData(
        title: "Order Placed",
        date: DateFormat("EEE, MMM d, yyyy, hh:mm aaa")
            .format(DateTime.parse(order.orderDate)),
        tracker_details: [
          TrackerDetails(
            title: "Your order was placed on",
            datetime: '',
          ),
        ],
      ),
      TrackerData(
        title: "Cooking ",
        date: DateFormat("EEE, MMM d, yyyy, hh:mm aaa")
            .format(DateTime.parse(order.orderDate)),
        tracker_details: [
          TrackerDetails(
            title: "Your ordered dish on cooking",
            datetime: '',
          ),
        ],
      ),
      TrackerData(
        title: "Food Ready ",
        date: DateFormat("EEE, MMM d, yyyy, hh:mm aaa")
            .format(DateTime.parse(order.orderDate)),
        tracker_details: [
          TrackerDetails(
            title: "Your ordered dish is ready now.",
            datetime: '',
          ),
        ],
      ),
      TrackerData(
        title: "Order Delivered",
        date: DateFormat("EEE, MMM d, yyyy, hh:mm aaa")
            .format(DateTime.parse(order.deliveryDate)),
        tracker_details: [
          TrackerDetails(
            title: "You received your order",
            datetime: '',
          ),
        ],
      ),
    ];
    return trackerData;
  }

  @override
  Widget build(BuildContext context) {
    return OrderTrackerZen(
      isShrinked: false,
      background_color: Colors.green,
      text_secondary_color: Colors.grey[800],
      animation_duration: 2000,
      tracker_data: order.orderStatus == 'Ordered'
          ? getTrackerData().sublist(0, 1)
          : order.orderStatus == 'COOKING'
              ? getTrackerData().sublist(0, 2)
              : order.orderStatus == 'FOOD READY'
                  ? getTrackerData().sublist(0, 3)
                  : getTrackerData().sublist(0, 4),
    );
  }
}
