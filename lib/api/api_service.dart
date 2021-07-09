import 'dart:async';
import 'dart:convert';

import 'package:e_connect_app/model/login_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.https(
      "reqres.in",
      '/api/login',
    );
    var requestJson = requestModel.toMap();
    print(" json request $requestJson");
    var data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
      final response = await http.post(url, body: data).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
              'Timeout', 500); // Replace 500 with your http code.
        },
      );
      print('response ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 400) {
        return LoginResponseModel.fromJson(response.body);
      } else {
       LoginResponseModel defaultReponse = new LoginResponseModel(error: "Error");
        print("errorexception");
        return LoginResponseModel.fromJson(defaultReponse.toJson());
      }
   
  }
}
