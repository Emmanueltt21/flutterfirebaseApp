/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../backend/api/handler.dart';
import '../backend/model/agencies_model.dart';
import '../backend/model/language_model.dart';
import '../backend/model/settings_model.dart';
import '../backend/model/support_model.dart';
import '../backend/parse/splash_parse.dart';
import '../helper/router.dart';

class SplashScreenController extends GetxController implements GetxService {
  final SplashScreenParse parser;
  late LanguageModel _defaultLanguage;
  LanguageModel get defaultLanguage => _defaultLanguage;
  late SettingsModel _settingsModel;
  SettingsModel get settinsModel => _settingsModel;


  late SupportModel _supportModel;
  SupportModel get supportModel => _supportModel;
  SplashScreenController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    getConfigData();

  }

  Future<bool> initSharedData() {
    return parser.initAppSettings();
  }



  Future<bool> getConfigData() async {
    bool isSuccess = false;
    print('SplashController ----->> Start');

    await Future.delayed(const Duration(seconds: 2));

    isSuccess =true;
    print('SplashController ----->> End');
   // Get.toNamed(AppRouter.getLoginRoute(),);
    return isSuccess;
  }





  String getLanguageCode() {
    return parser.getLanguagesCode();
  }
}
