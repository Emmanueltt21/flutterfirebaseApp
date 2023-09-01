/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/


import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_with_flutter_wordpress/services/wp_config.dart';

import '../../../helper/shared_pref.dart';
import '../api/api.dart';


class SignUpParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  SignUpParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> onSignUp(dynamic body) async {
    var response = await apiService.postPublic(WpConfig.signUp, body);
    return response;
  }



}
