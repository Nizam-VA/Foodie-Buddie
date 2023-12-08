import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/order/order_bloc.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:foodiebuddie/view/screen/orders/widgets/all_orders.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderBloc>().add(GetAllOrdersEvent());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Orders',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          bottom: TabBar(
            labelColor: Colors.green[900],
            isScrollable: true,
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.green, width: 5),
            ),
            tabs: const [
              Tab(text: 'All Orders'),
              Tab(text: "Delivered"),
              Tab(text: "Pending"),
            ],
          ),
        ),
        body: TabBarView(children: [
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return AllOrders(
                order: state.orders,
                count: state.orders.length,
                orderId: state.orders.map((e) => e.orderId.toString()).toList(),
                itemCount:
                    state.orders.map((e) => e.itemCount.toString()).toList(),
                orderDate: state.orders.map((e) => e.orderDate).toList(),
                price:
                    state.orders.map((e) => e.totalPrice.toString()).toList(),
                orderStatus: state.orders.map((e) => e.orderStatus).toList(),
              );
            },
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              List<Order> orders = state.orders
                  .where((e) => e.orderStatus.toLowerCase() == 'delivered')
                  .toList();
              print(orders.length);
              return AllOrders(
                order: orders,
                count: orders.length,
                orderId:
                    orders.map((e) => e.transactionId.substring(24)).toList(),
                itemCount: orders.map((e) => e.itemCount.toString()).toList(),
                orderDate:
                    orders.map((e) => e.orderDate.substring(0, 10)).toList(),
                price: orders.map((e) => e.totalPrice.toString()).toList(),
                orderStatus: orders.map((e) => e.orderStatus).toList(),
              );
            },
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              List<Order> orders = state.orders
                  .where((e) => e.orderStatus.toLowerCase() == 'ordered')
                  .toList();
              print(orders.length);
              return AllOrders(
                order: orders,
                count: orders.length,
                orderId:
                    orders.map((e) => e.transactionId.substring(24)).toList(),
                itemCount: orders.map((e) => e.itemCount.toString()).toList(),
                orderDate:
                    orders.map((e) => e.orderDate.substring(0, 10)).toList(),
                price: orders.map((e) => e.totalPrice.toString()).toList(),
                orderStatus: orders.map((e) => e.orderStatus).toList(),
              );
            },
          ),
        ]),
      ),
    );
  }
}
