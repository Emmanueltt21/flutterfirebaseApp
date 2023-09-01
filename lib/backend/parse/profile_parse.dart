/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';


import '../../helper/shared_pref.dart';
import '../api/api.dart';

class ProfileParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProfileParser(
      {required this.apiService, required this.sharedPreferencesManager});



  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }
}
