import 'package:bloc/bloc.dart';
import 'package:foodiebuddie/controller/api_services/orders/api_calls.dart';
import 'package:foodiebuddie/model/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<GetAllOrdersEvent>((event, emit) async {
      final orders = await OrdersApiServices().getAllOrders();
      print(orders);
      emit(OrderState(orders: orders));
    });
  }
}
