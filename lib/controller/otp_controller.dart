import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/backend/authentication_repository.dart';
import 'package:pay_with_flutter_wordpress/backend/parse/otp_parse.dart';
import 'package:pay_with_flutter_wordpress/helper/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/app_services.dart';
import '../utils/toast.dart';


class OTPController extends GetxController {
  final OtpParser parser;


  OTPController({required this.parser});


  String emailAddress ="";

  @override
  void onReady() {
    initData();
  }

 /* void verifyOTPOLD(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(AppRouter.getHomeRoute()) : Get.back();
  }*/

  void initData() async  {
    var transData = Get.arguments;
    print('PhoneNumber ---->> ${transData[0]}');
    print('Email ---->> ${transData[1]}');
    emailAddress = transData[1];
    // transData
   await  AuthenticationRepository.instance.phoneAuthentication(transData[0].toString());

  }







  void validateOTP (otpCode ) async {
    var context = Get.context as BuildContext;
    print('Validate OTP .... ');
    EasyLoading.show(status: 'Verifying  OTP...');

    AppServices().checkInternet().then((hasInternet) async {
      if (!hasInternet!) {
        //_btnController.reset();
        EasyLoading.dismiss();
        onAlertError(context, 'no internet Connection');
        // openSnacbar(context, 'no internet'.tr());
      } else {

        try{
          var isVerified = await AuthenticationRepository.instance.verifyOTP(otpCode);
          if(isVerified) {
            EasyLoading.dismiss();
            successToast("Phone number Has been Verified");
            Get.toNamed(AppRouter.getVerifyEmail(),
            arguments: [emailAddress]);
          }else{
            EasyLoading.dismiss();
            Get.back();
          }

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
