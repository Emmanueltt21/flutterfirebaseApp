/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../helper/shared_pref.dart';
import '../api/api.dart';

class ForgotPasswordParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ForgotPasswordParser(
      {required this.sharedPreferencesManager, required this.apiService});


}
