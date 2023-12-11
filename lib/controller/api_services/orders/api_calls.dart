import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/order.dart';
import 'package:foodiebuddie/model/order_item.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class OrdersApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<List<Order>> getAllOrders() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAllOrders,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        final body = response.data as Map;
        final result = body['orders'] as List;
        List<Order> orders = result.map((e) => Order.fromJson(e)).toList();

        for (int i = 0; i < result.length; i++) {
          print(orders[i].orderStatus);
        }

        return orders;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<OrderItem>> getOrderById(int orderId) async {
    final token = await getToken();
    try {
      final response = await dio.get(
        '${ApiEndPoints.getOrderById}$orderId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['orderItems'] as List;
        List<OrderItem> orderItems = [];
        for (int i = 0; i < result.length; i++) {
          final orderItem = OrderItem.fromJson(result[i]);
          orderItems.add(orderItem);
        }
        return orderItems;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
