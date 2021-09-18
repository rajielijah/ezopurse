import 'package:ezopurse/model/core/login_model.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:ezopurse/sharePreference/login_shared_preference.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

enum Status {
  NotLoggedIn,
  LoggedIn,
  LoggedOut,
  Authenticating,
}

class LoginProvider with ChangeNotifier {
   Status _loggedInStatus = Status.NotLoggedIn;
   Status get loggedInStatus => _loggedInStatus;
   Login logins;
   bool logining = false;
  void checkloginactivity(bool loginings) {
    logining = loginings;
    notifyListeners();
  }


Future<Map<String, dynamic>> login(String email, String password)  async {
  var result;
  final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
  };
  print(loginData);
   _loggedInStatus = Status.Authenticating;
  notifyListeners();
  Response response = await post(
    Uri.parse("https://ihsapi.herokuapp.com/api/authenticate/login"),
  body: json.encode(loginData),
    headers: {
        'Content-Type': 'application/json',
      },
  );
 if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
  print('this is $responseData');
      var userData = responseData['user'];
      Login authUser = Login.fromJson(userData);
      var thisData = authUser.toJson();
      print(thisData);
      print('authUser ${authUser.toJson()}');
      if (authUser.isLoggedIn  == true) {
        print('weewe wewe');
        print('userData ${authUser.toJson()}');
        UserPreferences().saveUser(Login.fromJson(userData));
        var currentUser = Login.fromJson(responseData);
        _loggedInStatus = Status.LoggedIn;
        notifyListeners();
        result = {
          'status': true,
          'message': 'Successfuls',
          'user': Login.fromJson(userData)
        };
      } else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {
          'status': false,
          'message': json.decode(response.body)['message']
        };
      }
}
  return result;
}

}