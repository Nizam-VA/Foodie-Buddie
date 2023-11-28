import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/cart_item.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class CartApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<bool> addToCart(int dishId) async {
    final token = await getToken();
    print('${ApiEndPoints.addToCart}$dishId');
    try {
      final response = await dio.post(
        '${ApiEndPoints.addToCart}$dishId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> decreaseFromCart(int dishId) async {
    final token = await getToken();
    try {
      final response = await dio.patch(
        '/cart/$dishId/decrement',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> deleteItemFromCart(int dishId) async {
    final token = await getToken();
    try {
      final response = await dio.delete(
        '/cart/$dishId/deleteItem',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<List<CartItem>> getAllCartItems() async {
    try {
      final token = await getToken();
      final response = await dio.get(
        ApiEndPoints.getAllCartItems,
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
        final data = body['cart'] as Map;
        final result = data['dishes'] as List;
        List<CartItem> cartItems = [];
        // result.map((cartItem) => CartItem.fromJson(cartItem)).toList();
        for (int i = 0; i < result.length; i++) {
          final cartItem = CartItem.fromJson(result[i]);
          print(cartItem.name);
          cartItems.add(cartItem);
        }
        return cartItems;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
