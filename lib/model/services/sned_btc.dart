import 'dart:convert';

import 'package:ezopurse/model/core/login_model.dart';
import 'package:ezopurse/model/core/send_btc.dart';
import 'package:ezopurse/model/services/base_api.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class SendProvider with ChangeNotifier{
  SendBtc send;

Future<Map<String, dynamic>> sendBtc(String address, String amount ) async {
  var result;
final Map<String, dynamic> sendBtcData = {
  'address': address,
  'amount': amount
}; 
  print('$sendBtcData');
  notifyListeners();
  Response response = await post(
    Uri.parse("https://onos-btc.herokuapp.com/api/user/send/btc"),
    body: json.encode(sendBtcData),
    headers: {
        'Content-Type': 'application/json',
    }
  );
  print("we wkniwiw");
  if(response.statusCode == 200){
    final Map<String, dynamic> responseData = json.decode(response.body);
    print('We need $responseData');
    SendBtc authSend = SendBtc.fromJson(responseData);
    if(authSend.success == true){
      notifyListeners();
      result ={
        'status': true, 'message': 'Sent Successfully', 
        'send': SendBtc.fromJson(responseData)
      };
    }
    else{
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