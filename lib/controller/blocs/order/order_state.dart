part of 'order_bloc.dart';

class OrderState {
  final List<Order> orders;
  OrderState({required this.orders});
}

final class OrderInitial extends OrderState {
  OrderInitial() : super(orders: []);
}
