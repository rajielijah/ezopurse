import 'package:ezopurse/model/core/login_model.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:ezopurse/sharePreference/login_shared_preference.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  NotLoggedIn,
  LoggedIn,
  LoggedOut,
  Authenticating,
}

class LoginProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status get loggedInStatus => _loggedInStatus;
  LoginModel logins;
  bool logining = false;
  void checkloginactivity(bool loginings) {
    logining = loginings;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };
    print(loginData);
    //  _loggedInStatus = Status.Authenticating;
    notifyListeners();
    Response response = await post(
      Uri.parse(BaseService.loginRoot),
      body: json.encode(loginData),
      headers: {
        // 'Content-Type': 'application/json',
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
    ).catchError((e) {
      print('na you dey give us $e');
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', responseData['token']);
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('id', responseData["user"]["_id"]);
      LoginModel authUser = LoginModel.fromJson(responseData);
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      result = {
        'status': true,
        'message': 'Successful',
        'user': LoginModel.fromJson(responseData)
      };
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
// if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = json.decode(response.body);

//       var userData = responseData;
//       LoginModel authUser = LoginModel.fromJson(userData);
//       // var thisData = authUser.toJson();
//       print('authUser ${authUser.toJson()}');
//       if (responseData['isLoggedIn']  == true) {
//         // print('userData ${authUser.toJson()}');
//         // var currentUser = Login.fromJson(responseData);
//         _loggedInStatus = Status.LoggedIn;
//         notifyListeners();
//         result = {
//           'status': true,
//           'message': 'Successfuls',
//           'user': LoginModel.fromJson(responseData)
//         };
//       } else {
//         _loggedInStatus = Status.NotLoggedIn;
//         notifyListeners();
//         result = {
//           'status': false,
//           'message': json.decode(response.body)['message']
//         };
//       }
// }}}