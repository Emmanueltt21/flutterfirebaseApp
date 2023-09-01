/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../backend/api/handler.dart';
import '../backend/parse/contactus_parse.dart';


class SettingsController extends GetxController implements GetxService {
  final ContactUsParser parser;
  String title = 'Contact Us'.tr;
  RxBool isLogin = false.obs;

  SettingsController({required this.parser});


}
