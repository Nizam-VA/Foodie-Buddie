import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/dish.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class FavoriteApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<bool> addToFavorites(int dishId) async {
    final token = await getToken();
    try {
      final response = await dio.post(
        '${ApiEndPoints.addToFavorites}$dishId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
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

  Future<bool> deleteFromFovorites(int dishId) async {
    final token = await getToken();
    try {
      final response = await dio.delete(
        '/favourites/$dishId/delete',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
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

  Future<List<Dish>> getAllFavorites() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAllFavorites,
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
        final result = body['result'] as List;
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
