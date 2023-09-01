import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/backend/authentication_repository.dart';
import 'package:pay_with_flutter_wordpress/backend/exceptions/TExceptions.dart';
import 'package:pay_with_flutter_wordpress/backend/parse/otp_parse.dart';
import 'package:pay_with_flutter_wordpress/helper/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pay_with_flutter_wordpress/screens/splash/splash_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/app_services.dart';
import '../utils/toast.dart';


class EmailVerifyController extends GetxController {
  final OtpParser parser;

  late Timer _timer ;



  EmailVerifyController({required this.parser});

  @override
  void onReady(){
    sendEmailV();
  }






  /// Send Email Verification
  Future<void> sendEmailV() async {
    var context = Get.context as BuildContext;
    try{
      AuthenticationRepository.instance.sendEmailVerification();
    }catch(e){
      onAlertError(context, e.toString());
    }

  }
//



  void setTimerForAutoRedirect () async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer){
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        setInitialScreen(user);
      }
    });

  }

  void setInitialScreen(User user){
    user == null
        ?Get.offAll(() => SplashScreen()) :
        user.emailVerified ? Get.toNamed(AppRouter.getHomeRoute())
            :Get.toNamed(AppRouter.getVerifyEmail());
  }

  void validVerificationManually () async {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      setInitialScreen(user);
    }
  }


  onAlertError(context, String paramMessage) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "ALERT",
      desc: paramMessage,
      buttons: [
        DialogButton(
          onPressed: (){
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }



  }
