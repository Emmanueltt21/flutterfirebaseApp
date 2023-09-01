/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/parse/language_parse.dart';

class LanguageController extends GetxController implements GetxService {
  final LanguageParser parser;

  int filter = 1;
  late String languageCode;
  LanguageController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    languageCode = parser.getDefault();
  }

  void onFilter(var id) {
    filter = id;
    update();
  }

  void saveLanguages(String code) {
    var locale = Locale(code.toString());
    Get.updateLocale(locale);
    parser.saveLanguage(code);
    languageCode = code;
    update();
  }
}
