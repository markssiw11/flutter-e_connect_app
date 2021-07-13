import 'dart:async';

import 'package:e_connect_app/controllers/auto_login_controller.dart';
import 'package:e_connect_app/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    try {
      var url = getBaseUrl('auth/login');
      var requestJson = requestModel.toJson();
      print(" json request $requestJson");
      final response = await http.post(url, body: requestJson, headers: {
        "Content-Type": "application/json",
        "X-App-Version": "1.0.0"
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
              'timeout', 500); // Replace 500 with your http code.
        },
      );
      String? xReturnCode = response.headers['x-return-code'];
      print('response $xReturnCode');
      switch (response.statusCode) {
        case 200:
          if (xReturnCode == '0') {
            final controller = Get.put(AutoLoginController());
            LoginResponseModel loginData =
                LoginResponseModel.fromJson(response.body);
            controller.setProfile(response.body);
            controller.setRefreshToken(loginData.refresh_token);
            controller.setAccessToken(loginData.access_token ?? '');
          }
          return LoginResponseModel.fromJson(response.body);
        case 400:
          LoginResponseModel errorDefault = new LoginResponseModel(
              name: "SymtemError",
              message:
                  "Có lỗi xãy ra vui lòng liên hệ tổng đài để được giúp đỡ");
          switch (xReturnCode) {
            case '9':
              return LoginResponseModel(
                  name: 'AccountDoesNotExist',
                  message: "Tài khoản này chưa tồn tại");

            case '10':
              return LoginResponseModel(
                  name: "PasswordIncorrect", message: "Sai mật khẩu");
            default:
              return errorDefault;
          }
        default:
          return LoginResponseModel.fromJson(response.body);
      }
    } catch (e) {
      print("errpr $e");
      LoginResponseModel errorDefault = new LoginResponseModel(
          name: "SymtemError",
          message: "Có lỗi xãy ra vui lòng liên hệ tổng đài để được giúp đỡ");
      return errorDefault;
    }
  }

  Future refreshToken(String? rfToken) async {
    var url = getBaseUrl('auth/refreshToken');

    final response = await http.post(url,
        body: json.encode({"refreshToken": rfToken}),
        headers: {
          "Content-Type": "application/json",
          "X-App-Version": "1.0.0",
        }).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(
            'timeout', 500); // Replace 500 with your http code.
      },
    );
    final controller = Get.put(AutoLoginController());

    String? xReturnCode = response.headers['x-return-code'];
    print('rf======= ${response.body} $xReturnCode');
    if (xReturnCode == '0') {
      RefreshTokenResponse jsonBody = RefreshTokenResponse.fromJson(response.body);
      if (jsonBody.access_token != null ) {
        controller.setRefreshToken(jsonBody.refresh_token);
        controller.setAccessToken(jsonBody.access_token ?? '');
      }
    }
    return xReturnCode;
  }
}

Uri getBaseUrl(String url) {
  String urlForPlarForm = Platform.isAndroid
      ? 'http://10.0.2.2:7979/bts/api/v1/$url'
      : 'http://localhost:7979/bts/api/v1/$url';
  return Uri.parse(urlForPlarForm);
}
