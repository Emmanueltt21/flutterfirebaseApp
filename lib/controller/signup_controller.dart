/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/backend/authentication_repository.dart';
import 'package:pay_with_flutter_wordpress/backend/parse/signup_parse.dart';
import 'package:pay_with_flutter_wordpress/helper/router.dart';
import 'package:pay_with_flutter_wordpress/screens/otp/otp_screen.dart';

import '../backend/model/user_model.dart';
import '../backend/parse/language_parse.dart';
import '../backend/user_repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../backend/api/handler.dart';
import '../backend/exceptions/signup_email_password_failure.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/app_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpController extends GetxController implements GetxService {
  final SignUpParser parser;

  SignUpController({required this.parser});

  @override
  void onInit() {
    super.onInit();
  }





/*

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      {}
    } on FirebaseException catch (e) {
      print("FirebaseException -->> \n");
      print(e);
    } catch (e) {}
  }


*/



  Future<void> createUser (UserModel user) async {
    var context = Get.context as BuildContext;
    print('Signing .... ');
    EasyLoading.show(status: 'Creating Account...');


    AppServices().checkInternet().then((hasInternet) async {
      if (!hasInternet!) {
        //_btnController.reset();
        EasyLoading.dismiss();
        onAlertError(context, 'no internet Connection');
        // openSnacbar(context, 'no internet'.tr());
      } else {

        String responseData;
        try{

         await  AuthenticationRepository.instance.createUserWithEmailAndPassword(user.email!, user.password!);
          print('phoneAuthentication ....');
          await AuthenticationRepository.instance.createUserFirebase(user);
          EasyLoading.dismiss();

         ///Phone Auth
          Get.toNamed(AppRouter.getOtpScreen(),
          arguments: [user.phoneNo!, user.email!, ]);

         ///Email Auth
         Get.toNamed(AppRouter.getVerifyEmail(),
             arguments: [user.phoneNo!, user.email!, ]);

          /* if(responseData =="01"){
            EasyLoading.dismiss();
            Get.toNamed(AppRouter.getHomeRoute());
          }else{
            EasyLoading.dismiss();
            showToast(responseData);
          }*/

        }catch(e){
          EasyLoading.dismiss();
          print("Exception -->> \n");
          print(e);
          onAlertError(context, e.toString());

        }
      }
    });



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
