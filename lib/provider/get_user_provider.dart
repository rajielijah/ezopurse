

import 'package:ezopurse/model/core/user_model.dart';
import 'package:ezopurse/model/services/get_user.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel profie;
  String message = '';

  ProfileProvider() {
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try{
      await Future.delayed(Duration(seconds: 3));
      final apiUser = await UserApi.instance.getUser();
      profie = apiUser;
      print("Prinnt $profie");
    }
    catch(e){
      message = '$e';
      print(message);
    }
    notifyListeners();
  }

}