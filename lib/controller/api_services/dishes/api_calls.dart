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
        print(dishes.length);
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
