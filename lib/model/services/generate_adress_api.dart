import 'dart:convert';
import 'package:ezopurse/model/core/generate_btc_adress_mode.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GenerateAddressApi {
  static GenerateAddressApi _instance;

  GenerateAddressApi._();

  static GenerateAddressApi get instance {
    if (_instance == null) {
      _instance = GenerateAddressApi._();
    }
    return _instance;
  }

  Future<GenerateAddressModel> generateAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString('id');
    String url = "https://ezopurze.herokuapp.com/api/payment/$id";
    print(url);
    final response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      "Authorization": "Bearer $token"
    }).catchError((e) {
      print(e);
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      GenerateAddressModel result = GenerateAddressModel.fromJson(responseData);
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
