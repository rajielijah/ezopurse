import 'dart:convert';

import 'package:ezopurse/model/core/login_model.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<Map<String, dynamic>> forgotPassword(String email) async {
  var result;
  final Map<String, dynamic> forgotPasswordData = {
      'email': email,
    };
    print(forgotPasswordData);
    Response response = await post(
     Uri.parse( BaseService.forgotPassword),
      body: json.encode(forgotPasswordData),
      headers: {'Content-Type': 'application/json'},
    );
    print(response);
    print('response: ${response.statusCode}.');
    if (response.statusCode == 200 || response.statusCode == 404) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print('responseData: $responseData');
      // print("responseData:" ${ responseData);
      var userData = responseData;
      LoginModel authUser = LoginModel.fromJson(userData);
      // print(authUser.toJson());
      print('authUser: ${authUser.toJson()}.');
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
//
      result = {
        'status': false,
        'message': 'failed',
        // 'data': responseData
      };
    }

    return result;
}