import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/coupon.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class CouponApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<List<Coupon>> getAllCoupons() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAllCoupons,
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
        final result = body['coupons'] as List;
        List<Coupon> coupons = [];
        for (int i = 0; i < result.length; i++) {
          final coupon = Coupon.fromJson(result[i]);
          coupons.add(coupon);
        }
        return coupons;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Coupon>> getAvailableCoupons() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAvailableCoupons,
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
        final result = body['coupons'] as List;
        List<Coupon> coupons = [];
        for (int i = 0; i < result.length; i++) {
          final coupon = Coupon.fromJson(result[i]);
          coupons.add(coupon);
        }
        return coupons;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
