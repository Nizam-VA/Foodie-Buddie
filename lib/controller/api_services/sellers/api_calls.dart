import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:http/http.dart' as http;

class SellerApiServices {
  static const String baseUrl = 'http://10.0.2.2:8080';

  Future<List<Seller>> fetchAllSellers() async {
    const url = '$baseUrl/sellers?p=1&l=10';

    String bearer = await getToken();

    try {
      print('hello');
      print('$bearer is your token');
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
          debugPrint(seller.name);
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
}
