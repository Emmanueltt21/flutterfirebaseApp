/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../helper/shared_pref.dart';
import '../api/api.dart';

class ContactUsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ContactUsParser(
      {required this.sharedPreferencesManager, required this.apiService});


  String getSupportEmail() {
    return sharedPreferencesManager.getString('supportEmail') ?? '';
  }
}
