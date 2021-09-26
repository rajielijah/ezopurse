import 'dart:convert';

import 'package:ezopurse/model/services/base_api.dart';
import 'package:http/http.dart' as http;

import 'package:ezopurse/model/core/wallet_state_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletStateApi {
  static WalletStateApi _instance;

  WalletStateApi._();

  static WalletStateApi get instance {
    if (_instance == null) {
      _instance = WalletStateApi._();
    }
    return _instance;
  }


Future<WalletStateModel> getWalletState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
  final response = await http.get(Uri.parse(BaseService.walletState), 
  headers: {
     'Accept': 'application/json',
     "Authorization": "Bearer $token"
  }).catchError((e){
      print('boss $e');
  });
  if(response.statusCode == 200){
    final Map<String, dynamic> responseData = json.decode(response.body);
    WalletStateModel result = WalletStateModel.fromJson(responseData);
    return result;
  }
  else{

    throw Exception('Failed to load post');
  }
}}