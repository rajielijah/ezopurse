import 'dart:convert';

import 'package:ezopurse/constant/converFaq.dart';
import 'package:ezopurse/model/core/faq_model.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:http/http.dart' as http;
class FaqApi {
  static FaqApi _instance;

  FaqApi._();

  static FaqApi get instance {
    if (_instance == null) {
      _instance = FaqApi._();
    }
    return _instance;
  }

  Future<List<FaqModel>> getAllFaq() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString('token');
    final response = await http.get(Uri.parse(BaseService.getFaq), headers: {
  'Accept': 'application/json',
  // 'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      print(response.body);

      List<dynamic> decoded = jsonDecode(response.body);
      print('This is it $decoded');
      List<FaqModel> result = convertJsonToFaqModelList(response.body);
      print("This is the $result");
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}