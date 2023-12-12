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
          centerTitle: true,
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
              );
            },
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              List<Order> orders = state.orders
                  .where((e) => e.orderStatus.toLowerCase() == 'delivered')
                  .toList();
              return AllOrders(
                order: orders,
              );
            },
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              List<Order> orders = state.orders
                  .where((e) =>
                      e.orderStatus.toLowerCase() == 'ordered' ||
                      e.orderStatus.toLowerCase() == 'pending' ||
                      e.orderStatus.toLowerCase() == 'food ready')
                  .toList();
              return AllOrders(
                order: orders,
              );
            },
          ),
        ]),
      ),
    );
  }
}
