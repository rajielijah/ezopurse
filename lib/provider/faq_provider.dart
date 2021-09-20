

import 'package:ezopurse/model/core/faq_model.dart';
import 'package:ezopurse/model/services/faq_api.dart';
import 'package:flutter/foundation.dart';

class FaqProvider with ChangeNotifier {
  List<FaqModel> faq = [];
  String message = '';

  FaqProvider() {
      _fetchFaq();
  }

  Future<void> _fetchFaq() async {
     try {
      await Future.delayed(Duration(seconds: 3));
      final apiFaq = await FaqApi.instance.getAllFaq();
      faq = apiFaq;
      print('Print $faq');

    } catch (e) {
      message = '$e';
      print(message);
    }
    notifyListeners();
}
}

