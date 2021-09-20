import 'dart:convert';
import 'package:ezopurse/model/core/add_bank_details.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AddBankProvider with ChangeNotifier {
  Future<Map<String, dynamic>> addBank(String accountNumber, String bankName, String accountName) async {
    var result;
    final Map<String, dynamic> addBankData = {
      'accountNumber': accountNumber,
      'bankName': bankName,
      'accountName': accountName
    };
    print(addBankData);
    notifyListeners();
    Response response = await post(Uri.parse(BaseService.loginRoot),
    body: json.encode(addBankData), headers: {
       'Content-Type': 'application/json',
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