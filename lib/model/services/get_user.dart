import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ezopurse/model/core/user_model.dart';

class UserApi{
    static UserApi _instance;

  UserApi._();

  static UserApi get instance {
    if (_instance == null) {
      _instance = UserApi._();
    }
    return _instance;
  } 

    Future<ProfileModel> getUser() async {
      final response = await http.get(
        Uri.parse("https://onos-btc.herokuapp.com/api/user/604695c6886f6400046f2a8e"),
         headers: {
           'Accept': 'application/json',
        }).catchError((e){
          print(e);
        });
        if(response.statusCode == 200) {
          print(response.body);
          final result = jsonDecode(response.body);
          ProfileModel profile = ProfileModel.fromJson(result);
          return profile;
        }
        else {
          throw Exception('Failed to load post');
    }
}}