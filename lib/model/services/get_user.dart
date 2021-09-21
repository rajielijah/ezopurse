import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ezopurse/model/core/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      print("This is the token $token");
      SharedPreferences pref = await SharedPreferences.getInstance();
      String id = pref.getString('id');
      String url = "https://onos-btc.herokuapp.com/api/user/$id";
       print(url);
      final response = await http.get(
        Uri.parse(url),
         headers: {
           'Accept': 'application/json',
            'Authorization': 'Bearer $token'
        }).catchError((e){
          print(e);
        });
        if(response.statusCode == 200) {
          print('Checking as always $response.body');
          final result = json.decode(response.body);
          ProfileModel profile = ProfileModel.fromJson(result);
          print("baba ${profile.data.firstName}");
          return profile;
        }
        else {
          throw Exception('Failed to load post');
    }
}

  Future<String> getFirstName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      print("This is the token $token");
      SharedPreferences pref = await SharedPreferences.getInstance();
      String id = pref.getString('id');
      String url = "https://onos-btc.herokuapp.com/api/user/$id";
       print(url);
      final response = await http.get(
        Uri.parse(url),
         headers: {
           'Accept': 'application/json',
            'Authorization': 'Bearer $token'
        }).catchError((e){
          print(e);
        });
        if(response.statusCode == 200) {
          print('Checking as always $response.body');
          final result = jsonDecode(response.body)['data']['firstName'];
          // ProfileModel profile = ProfileModel.fromJson(result);
          // print("baba ${profile.data.firstName}");
          return result;
        }
        else {
          throw Exception('Failed to load post');
    }
} 

}