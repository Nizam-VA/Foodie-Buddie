import 'package:dio/dio.dart';
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

  Future<void> deleteFromFovorites(int dishId) async {
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
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
