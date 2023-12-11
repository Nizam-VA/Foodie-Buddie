import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/orders/api_calls.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:foodiebuddie/model/order_item.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<GetAllOrdersEvent>((event, emit) async {
      final orders = await OrdersApiServices().getAllOrders();
      emit(OrderState(orders: orders, orderItems: []));
    });

    on<GetOrderByIdEvent>((event, emit) async {
      final orders = await OrdersApiServices().getAllOrders();
      final orderItems = await OrdersApiServices().getOrderById(event.orderId);
      emit(OrderState(orders: orders, orderItems: orderItems));
    });
  }
}

class OrderApiServices {}
