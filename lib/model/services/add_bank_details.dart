import 'dart:convert';
import 'package:ezopurse/model/core/add_bank_details.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBankProvider with ChangeNotifier {
  Future<Map<String, dynamic>> addBank(String accountNumber, String bankName, String accountName, String bvn) async {
    var result;
    final Map<String, dynamic> addBankData = {
      'accountNumber': accountNumber,
      'bankName': bankName,
      'accountName': accountName,
      'bvn': 'bvn'
    };
    print(addBankData);
    notifyListeners();
         SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
     SharedPreferences pref = await SharedPreferences.getInstance();
      String id = pref.getString('id');
      String url = "https://onos-btc.herokuapp.com/api/add/account/$id";
    Response response = await post(Uri.parse(url),
    body: json.encode(addBankData), headers: {
       'Content-Type': 'application/json',
       'Authorization': 'Bearer $token'

    }).catchError((e){
      print('boss free us $e');
    });
    if(response.statusCode == 200){
      print('na here we go w');
      final Map<String, dynamic> responseData = json.decode(response.body);
      print('this is $responseData');
      AddBankModel addBank = AddBankModel.fromJson(responseData);
      if(addBank.user.terms == true){
        notifyListeners();
        result = {
          'status': true, 'message': "Added Successfully", 'add': AddBankModel.fromJson(responseData)
        };
      }
      else {
        result = {
          'status': false,
          'message': 'Failed'
        };
        notifyListeners();
      }
    }

    return result;
}  
}