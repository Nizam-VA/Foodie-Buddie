import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/profile.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class ProfileApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<Profile?> getUserProfile() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getUserProfile,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          },
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['user'] as Map<String, dynamic>;
        final Profile user = Profile.fromJson(result);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> updateUser(Profile profile) async {
    final token = await getToken();
    final data = {
      'email': profile.email,
      'firstName': profile.firstName,
      'lastName': profile.lastName
    };
    try {
      final response = await dio.patch(
        ApiEndPoints.updateUserProfile,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: data,
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
}
