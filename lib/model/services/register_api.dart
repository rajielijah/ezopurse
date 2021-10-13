import 'dart:async';
import 'dart:convert';

import 'package:ezopurse/model/core/register_model.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

enum Status {
  NotRegistered,
  NotLoggedIn,
  Registered,
  Authenticating,
  Registering,
  loggedInStatus
}

class RegisterProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;
  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String passwordConfirmation,
      bool terms) async {
    final Map<String, dynamic> registerData = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'terms': true
    };
    return await post(Uri.parse(BaseService.regiserRoot),
        body: json.encode(registerData),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        }).then(onValue).catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      var userData = responseData;
      print(userData);
      // ['data'];
      Register authUser = Register.fromJson(userData);
      // UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
//      if (response.statusCode == 401) Get.toNamed("/login");
      Register authUser = Register.fromJson(responseData);
      result = {
        'status': false,
        'message': '$responseData',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
