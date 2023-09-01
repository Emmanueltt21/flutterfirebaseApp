/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';


import '../../helper/shared_pref.dart';
import '../api/api.dart';

class HomeParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  HomeParser(
      {required this.sharedPreferencesManager, required this.apiService});






  void onSaveAccCed(String codeAge, String codeCpt) {
    sharedPreferencesManager.putString('cpt', codeCpt);
    sharedPreferencesManager.putString('age', codeAge);

  }

  String getToken() {
    return sharedPreferencesManager.getString('token') ?? 'NA';
  }

  String getCodeCli() {
    return sharedPreferencesManager.getString('codecli') ?? 'NA';
  }

  String getCodeWall() {
    return sharedPreferencesManager.getString('codewal') ?? 'NA';
  }
  String getTypeWal() {
    return sharedPreferencesManager.getString('typewal') ?? 'NA';
  }
  String getAge() {
    return sharedPreferencesManager.getString('age') ?? 'XXX';
  }
  String getCPT() {
    return sharedPreferencesManager.getString('cpt') ?? 'XXX';
  }



  String getUserName() {
    return sharedPreferencesManager.getString('first_name') ??
        "No Name";
  }



  String getAddressName() {
    return sharedPreferencesManager.getString('address') ?? 'Home';
  }

  double getLat() {
    return sharedPreferencesManager.getDouble('lat') ?? 0.0;
  }

  double getLng() {
    return sharedPreferencesManager.getDouble('lng') ?? 0.0;
  }

  String getEtab() {
    return sharedPreferencesManager.getString('etab') ?? 'NA';
  }


  bool isLogin() {
    return sharedPreferencesManager.getString('uid') != '' &&
        sharedPreferencesManager.getString('uid') != null
        ? true
        : false;
  }


  void clearAccount() {
    sharedPreferencesManager.clearKey('first_name');
    sharedPreferencesManager.clearKey('last_name');
    sharedPreferencesManager.clearKey('token');
    sharedPreferencesManager.clearKey('uid');
    sharedPreferencesManager.clearKey('email');
    sharedPreferencesManager.clearKey('cover');
  }


}
