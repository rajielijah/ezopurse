import 'dart:convert';
import 'package:ezopurse/model/core/add_bank_details.dart';
import 'package:ezopurse/model/core/buy_sell_model.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellApi with ChangeNotifier {
  Future<Map<String, dynamic>> sellProof(
    int amount,
    String proof,
  ) async {
    var result;
    final Map<String, dynamic> sellData = {
      "amount": amount,
      "proof": proof,
      "transactionType": "SELL"
    };
    print(sellData);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    String url = "https://onos-btc.herokuapp.com/api/buy-sell";
    Response response = await post(Uri.parse(url),
        body: json.encode(sellData),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }).catchError((e) {
      print('boss free us $e');
    });
    if (response.statusCode == 200) {
      print('na here we go w');
      final Map<String, dynamic> responseData = json.decode(response.body);
      print('this is $responseData');
      BuySellModel buySellModel = BuySellModel.fromJson(responseData);
      if (buySellModel.success == true) {
        notifyListeners();
        result = {
          'status': true,
          'message': "Added Successfully",
          'add': BuySellModel.fromJson(responseData)
        };
      } else {
        result = {'status': false, 'message': 'Failed'};
        notifyListeners();
      }
    }

    return result;
  }
}
