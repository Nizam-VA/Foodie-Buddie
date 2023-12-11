part of 'order_bloc.dart';

class OrderEvent {}

class GetAllOrdersEvent extends OrderEvent {}

class GetOrderByIdEvent extends OrderEvent {
  final int orderId;
  GetOrderByIdEvent({required this.orderId});
}
