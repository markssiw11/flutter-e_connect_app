import 'dart:async';
import 'dart:convert';

import 'package:e_connect_app/model/login_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    try {
      var url = Uri.parse('http://localhost:7979/bts/api/v1/auth/login');
      var requestJson = requestModel.toJson();
      print(" json request $requestJson");
      var data = {"phoneNumber": "0379077505", "password": "Long123@"};

      final response = await http.post(url, body: requestJson, headers: {
        "Content-Type": "application/json",
        "X-App-Version": "1.0.0"
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
              'Timeout', 500); // Replace 500 with your http code.
        },
      );
      String? xReturnCode = response.headers['x-return-code'];
      print('response $xReturnCode');
      switch (response.statusCode) {
        case 200:
          return LoginResponseModel.fromJson(response.body);
        default:
          return LoginResponseModel.fromJson(response.body);
      }
    } catch (e) {
      print("errpr $e");
      LoginResponseModel errorDefault = new LoginResponseModel(
          name: "SymtemError",
          message: "Có lỗi xãy ra vui lòng liên hệ tổng đài để được giúp đỡ");
      return LoginResponseModel.fromJson(errorDefault.toJson());
    }
  }
}
