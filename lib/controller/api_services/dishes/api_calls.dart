import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class DishApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<List<Dish>> fetchAllDishesByCategory(int categoryId) async {
    try {
      final token = await getToken();
      final response = await dio.get(
        '${ApiEndPoints.getDishesByCategory}$categoryId',
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
        final body = response.data as Map;
        final result = body['dishList'] as List;
        List<Dish> dishes = [];
        for (int i = 0; i < result.length; i++) {
          final dish = Dish.fromJson(result[i] as Map<String, dynamic>);
          dishes.add(dish);
        }
        return dishes;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Dish>> fetchAllDishesBySellerId(int sellerId) async {
    try {
      final response = await dio.get(
        '${ApiEndPoints.getDishesBySeller}$sellerId',
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['dishList'] as List;
        List<Dish> dishes = [];
        for (int i = 0; i < result.length; i++) {
          final dish = Dish.fromJson(result[i]);
          // print(dish.name);
          dishes.add(dish);
        }
        return dishes;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Dish>> fetchAllDishesByCatAndSeller(
      int sellerId, int catId) async {
    try {
      final response =
          await dio.get('/dishes?category=$catId&seller=$sellerId');
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['dishList'] as List;
        List<Dish> dishes = [];
        for (int i = 0; i < result.length; i++) {
          final dish = Dish.fromJson(result[i]);
          // print(dish.name);
          dishes.add(dish);
        }
        return dishes;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Dish>> searchDishes(String query, int sellerId) async {
    try {
      final token = await getToken();
      final response =
          await dio.get('/search/dishes?q=$query&seller=$sellerId');
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['dishList'] as List;
        List<Dish> dishes = [];
        for (int i = 0; i < result.length; i++) {
          final dish = Dish.fromJson(result[i]);
          print(dish.name);
          dishes.add(dish);
        }
        return dishes;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
