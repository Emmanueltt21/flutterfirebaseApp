/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/api/handler.dart';
import '../backend/parse/forgot_password_parse.dart';
import '../helper/router.dart';
import '../utils/toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotPasswordController extends GetxController implements GetxService {
  final ForgotPasswordParser parser;
  // Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  ForgotPasswordController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
  }


  Future<void> sendMail(emailAddress) async {
    if (emailAddress == '') {
      showToast('All Fields Are Required'.tr);
      return;
    }
    if (!GetUtils.isEmail(emailAddress)) {
      showToast('Email is not valid'.tr);
      return;
    }
    onFireBaseSendMail(emailAddress);
  }



  Future<void> onFireBaseSendMail(String mailAddress)  async {
    _auth.currentUser?.sendEmailVerification();
  }


  void onBack() {
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }

}
