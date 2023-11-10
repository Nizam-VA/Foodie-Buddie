import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/seller.dart';
import 'package:foodiebuddie/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static const String baseUrl = 'http://10.0.2.2:8080';
  //10.0.2.2

  //-----------------------------FetchAllSellers--------------------------------

  Future<List<Seller>> fetchAllSellers() async {
    const url = '$baseUrl/sellers';

    try {
      print('hello');
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJNb2RlbCI6eyJ1c2VySWQiOjIwLCJmaXJzdE5hbWUiOiJOaXNzYW0iLCJsYXN0TmFtZSI6IlZBIiwiZW1haWwiOiJuaXphbXVhc2hhcmFmQGdtYWlsLmNvbSIsInBob25lIjoiKzkxODg5MzU3NDY1NyIsInN0YXR1cyI6IlBlbmRpbmcifSwiZXhwIjoxNjk5NjA3ODkxfQ.T8Sg64Nu2Qz-PUcSeqiRGI0CoKnYgCtIyv2r1sJXP4s',
      });
      print('${response.statusCode} status');
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

  //---------------------------------SignUp-------------------------------------

  Future<bool> signUp(User user) async {
    const url = '$baseUrl/signup';
    final data = {
      "firstName": user.name,
      "lastName": "",
      "email": user.email,
      "password": user.password,
      "confirmPassword": user.rePassword,
      "phone": user.phone
    };
    try {
      final response = await http.post(Uri.parse(url), body: data);
      debugPrint('${response.statusCode}');
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map;
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', body['token']);
        print(body['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

//------------------------------OTP Verification--------------------------------

// Replace with your API base URL

  Future<bool> otpVerification(String otp) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? bearer = prefs.getString('token');

      if (bearer == null) {
        return false;
      }

      const String url = '$baseUrl/verifyOtp';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearer',
        },
        body: '{"otp": "$otp"}',
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  //-----------------------------------Login------------------------------------

  Future<bool> login(String email, String password) async {
    print('hello');
    try {
      const url = '$baseUrl/login';
      final data = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map;
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', body['token']);
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
