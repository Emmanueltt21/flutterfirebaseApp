/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/

import '../../helper/shared_pref.dart';
import '../api/api.dart';

class LanguageParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LanguageParser(
      {required this.sharedPreferencesManager, required this.apiService});

  void saveLanguage(String code) {
    sharedPreferencesManager.putString('language', code);
  }

  String getDefault() {
    return sharedPreferencesManager.getString('language') ??
        'en';
  }
}
