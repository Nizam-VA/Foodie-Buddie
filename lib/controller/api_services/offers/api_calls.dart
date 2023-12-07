import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/offer.dart';
import 'package:foodiebuddie/utils/urls.dart';

class OfferApiServices {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<List<Offer>> getAllOffers() async {
    // final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAllOffers,
        // options: Options(
        //   headers: {
        //     'Content-Type': 'application/json',
        //     'Accept': 'application/json',
        //     'Authorization': 'Bearer $token',
        //   },
        // ),
      );
      // print(response.data);
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['offerList'] as List;
        List<Offer> offers = [];
        for (int i = 0; i < result.length; i++) {
          final offer = Offer.fromJson(result[i]);
          offers.add(offer);
        }
        return offers;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
