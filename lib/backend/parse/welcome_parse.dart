/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/

import '../../helper/shared_pref.dart';
import '../api/api.dart';

class WelcomeParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  WelcomeParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
