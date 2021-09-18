import 'package:ezopurse/model/core/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(Login logins) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("email", logins.email);
    print("object prefere");

    return prefs.commit();
  }

  Future<Login> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email");
    return Login(
      email: email,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("email");

    // prefs.remove("token");
  }

//  Future<String> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString("token");
//     return token;
//   }
}
