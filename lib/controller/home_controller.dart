/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../backend/api/handler.dart';
import '../backend/parse/home_parse.dart';
import '../helper/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController implements GetxService {
  final HomeParser parser;

  bool apiCalled = true;
 // String title = '';

//  String currencySymbol = AppConstants.defaultCurrencySymbol;
//  String currencySide = AppConstants.defaultCurrencySide;
  String userName = "";
  String accNumber = "";
  bool haveData = false;


//Login Firebase
  // Variable
 // final _auth = FirebaseAuth.instance;
  //final Rx<User?> firebaseUser;
  var verificationId = "".obs;



  HomeController({required this.parser});

  @override
  void onInit() {
    super.onInit();
   // userName = parser.getUserName();
    //currencySymbol = parser.getCurrenySymbol();
   // currencySide = parser.getCurrenySide();
   // title = parser.getAddressName();
   // getHomeData();
    //firebaseUser = Rx<User?>(_auth.currentUser);
    // firebaseUser.bindStream(_auth.userChanges());
    initUserData();

  }



  void navOutApp() {
    parser.clearAccount();
    Get.offAllNamed(AppRouter.getLoginRoute());
  }

  void initUserData() {

  }





}
