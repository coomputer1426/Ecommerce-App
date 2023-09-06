import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:ecommerce/api/model/request/RegisterRequest.dart';
import 'package:ecommerce/api/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

import 'model/request/LoginRequest.dart';
import 'model/response/loginResponse.dart';

class ApiManager {
  // static const base_url = "route-ecommerce.vercel.app";
  // static const base_url = "route-ecommerce.onrender.com";

  static Future<RegisterResponse> register(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    RegisterRequest requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);

    var url = Uri.https(
      ApiConstants.base_url,
      ApiConstants.register,
    );
    debugPrint("Uri created");
    http.Response response = await http.post(url, body: requestBody.toJson());
    debugPrint("Response ${response.body}");
    // debugPrint("Response ${response.}");

    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login({
    // required String name,
    required String email,
    required String password,
    // required String rePassword,
    // required String phone
  }) async {
    LoginRequest requestBody = LoginRequest(
      // name: name,
      email: email,
      password: password,
      // rePassword: rePassword,
      // phone: phone
    );

    var url = Uri.https(
      ApiConstants.base_url,
      ApiConstants.login,
    );
    debugPrint("Uri created");
    http.Response response = await http.post(url, body: requestBody.toJson());
    debugPrint("Response ${response.body}");
    // debugPrint("Response ${response.}");

    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

class ApiConstants {
  static const base_url = 'ecommerce.routemisr.com';
  static const register = 'api/v1/auth/signup';
  static const login = 'api/v1/auth/signin';
}
