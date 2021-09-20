import 'dart:convert';

import 'package:ezopurse/model/core/faq_model.dart';

convertJsonToFaqModelList(String arrayObjsText) {
  var tagObjsJson = jsonDecode(arrayObjsText) as List;
  List<FaqModel> tagObjs =
      tagObjsJson.map((tagJson) => FaqModel.fromJson(tagJson)).toList();

  print('trying $tagObjs');
  return tagObjs;
}