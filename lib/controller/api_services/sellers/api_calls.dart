import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';
import 'package:http/http.dart' as http;

class SellerApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  static const String baseUrl = ApiEndPoints.baseUrl;
  Future<List<Seller>> fetchAllSellers() async {
    const url = '$baseUrl/user/sellers';

    String bearer = await getToken();
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      });

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final result = body['sellerList'] as List;
        final sellers = <Seller>[];
        for (int i = 0; i < result.length; i++) {
          final seller = Seller.fromJson(result[i]);
          sellers.add(seller);
        }
        return sellers;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<Seller>> searchSellers(String query) async {
    try {
      final response = await dio.get(ApiEndPoints.searchSeller + query);
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['sellerList'] as List;
        final sellers = <Seller>[];
        for (int i = 0; i < result.length; i++) {
          final seller = Seller.fromJson(result[i]);
          sellers.add(seller);
        }
        return sellers;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Seller?> getSellerById(int sellerId) async {
    String bearer = await getToken();

    try {
      final response = await dio.get('${ApiEndPoints.getSellerById}$sellerId',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearer',
          }));
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['seller'];
        final seller = Seller.fromJson(result);
        return seller;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
