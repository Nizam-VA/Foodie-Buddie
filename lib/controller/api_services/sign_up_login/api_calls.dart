import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/model/user.dart';
import 'package:foodiebuddie/utils/tokens.dart';
import 'package:foodiebuddie/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static const String baseUrl = ApiEndPoints.baseUrl;
  //10.0.2.2

  final dio = Dio(BaseOptions(baseUrl: baseUrl));

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
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
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
      final String bearer = await getToken();

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
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        final body = jsonDecode(response.body) as Map;
        await saveToken(body['token']);
        // final sharedPreferences = await SharedPreferences.getInstance();
        // sharedPreferences.setString('token', body['token']);
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
