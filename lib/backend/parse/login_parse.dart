/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/services/wp_config.dart';

import '../../helper/router.dart';
import '../../helper/shared_pref.dart';
import '../../services/config.dart';
import '../api/api.dart';



class LoginParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;


  LoginParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> onLogin(dynamic body) async {
    var response = await apiService.postPublic(WpConfig.login, body);
    return response;
  }

  Future<Response> getToken(dynamic body) async {
    var response = await apiService.postPublic(WpConfig.authToken, body);
    return response;
  }



  void saveToken(String token) {
    sharedPreferencesManager.putString('token', token);
  }

  void saveUserWallet(String mUserWallet) {
    sharedPreferencesManager.putString('codewal', mUserWallet);
  }

  void saveUID(String id) {
    sharedPreferencesManager.putString('uid', id);
  }

  void saveData(String cover, String firstName, String lastName, String mobile,
      String email, String codewal, String codecli, String ldel,String lnai,
      String adr, String brch, String typewal,String etab ,String codecli2,String codeCpt, String codeAge ) {
    debugPrint(firstName);
    debugPrint(lastName);
    debugPrint(mobile);
    debugPrint(email);

    sharedPreferencesManager.putString('cover', cover);
    sharedPreferencesManager.putString('first_name', firstName);
    sharedPreferencesManager.putString('last_name', lastName);
    sharedPreferencesManager.putString('phone', mobile);
    sharedPreferencesManager.putString('email', email);
    sharedPreferencesManager.putString('codewal', codewal);
    sharedPreferencesManager.putString('codecli', codecli);
    sharedPreferencesManager.putString('ldel', ldel);
    sharedPreferencesManager.putString('lnai', lnai);
    sharedPreferencesManager.putString('adr', adr);
    sharedPreferencesManager.putString('brch', brch);
    sharedPreferencesManager.putString('typewal', typewal);
    sharedPreferencesManager.putString('etab', etab);
    sharedPreferencesManager.putString('codecli2', codecli2);
    sharedPreferencesManager.putString('cpt', codeCpt);
    sharedPreferencesManager.putString('age', codeAge);
    sharedPreferencesManager.putString('primeWallet', codeCpt);
  }

  int userLogin() {
    return sharedPreferencesManager.getInt('userLogin') ??
        Config.userLogin;
  }




  String getFcmToken() {
    return sharedPreferencesManager.getString('fcm_token') ?? 'NA';
  }
}
