

import 'dart:convert';

import 'package:ezopurse/model/services/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:ezopurse/model/core/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionApi {
  static TransactionApi _instance;

  TransactionApi._();

  static TransactionApi get instance {
    if (_instance == null) {
      _instance = TransactionApi._();
    }
    return _instance;
  }


Future<TransactionModel> getTransaction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
    final response = await http.get(Uri.parse(BaseService.getTransaction), 
        headers: {
           'Accept': 'application/json',
          "Authorization": "Bearer $token"
        }
    ).catchError((e){
      print("Error $e");
    });
    if(response.statusCode == 200 ){
      final Map<String, dynamic> responseData = json.decode(response.body);
      TransactionModel result = TransactionModel.fromJson(responseData);
      return result;
    }
    else {
        throw Exception('Failed to load post');
    }
}
}