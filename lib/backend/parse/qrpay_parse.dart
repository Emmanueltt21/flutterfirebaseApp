/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/


import 'package:get/get_connect/http/src/response/response.dart';

import '../../helper/shared_pref.dart';
import '../api/api.dart';




class QrPayParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  QrPayParser({required this.sharedPreferencesManager, required this.apiService});



  String getToken() {
    return sharedPreferencesManager.getString('token') ?? 'NA';
  }

  String getCodeCli() {
    return sharedPreferencesManager.getString('codecli') ?? 'NA';
  }

  String getPrimeWallet() {
    return sharedPreferencesManager.getString('primeWallet') ?? 'XXX';
  }
  String getCodeWall() {
    return sharedPreferencesManager.getString('codewal') ?? 'NA';
  }
  String getTypeWal() {
    return sharedPreferencesManager.getString('typewal') ?? 'NA';
  }

  String getEtab() {
    return sharedPreferencesManager.getString('etab') ?? 'NA';
  }



}
