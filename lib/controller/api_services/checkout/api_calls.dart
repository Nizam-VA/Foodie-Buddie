import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/checkout.dart';
import 'package:foodiebuddie/model/checkout_response.dart';
import 'package:foodiebuddie/model/verify_payment.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';

class CheckOutApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<CheckoutResponse?> checkout(CheckOut checkOut) async {
    final token = await getToken();
    final data = checkOut.toJson(checkOut);
    try {
      final response = await dio.post(
        ApiEndPoints.checkOut,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          },
        ),
        data: data,
      );
      print(response.data);
      if (response.statusCode == 200) {
        final body = response.data as Map;
        CheckoutResponse checkoutResp;
        if (body.containsKey('result')) {
          final result = body['result'] as Map<String, dynamic>;
          checkoutResp = CheckoutResponse.fromJson(result);
          return checkoutResp;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> verifyPayment(VerifyPayment payment) async {
    print('hello😊😊😊');
    final token = await getToken();
    final data = payment.toJson(payment);
    try {
      final response = await dio.post(
        ApiEndPoints.verifyPayment,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
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
