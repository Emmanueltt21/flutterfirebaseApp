/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/backend/authentication_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/services/config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import '../backend/api/handler.dart';
import '../backend/exceptions/signup_email_password_failure.dart';
import '../backend/parse/login_parse.dart';
import '../helper/router.dart';
import '../services/app_services.dart';
import '../utils/toast.dart';
import 'home_controller.dart';




class LoginController extends GetxController implements GetxService {
  final LoginParser parser;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //final emailTextEditor = TextEditingController();
  //final passwordTextEditor = TextEditingController();

  String countryCode = '+91';
  int smsId = 1;
  String otpCode = '';
  bool passwordVisible = true;
  String callbackURL = '';

  int loginVersion = Config.userLogin;
  String smsName = "2";
  bool isRemembered = false;
  bool isChecked = true;
  final String termsURL = 'https://www.bicec.com/';
  var mToken = "";


  var verificationId = "".obs;



  LoginController({required this.parser});

  @override
  void onInit() {
    super.onInit();
   // smsName = parser.smsName();
   // loginVersion = parser.userLogin();
   // callbackURL = Get.arguments[0];
    isChecked =true;

    //emailTextEditor.text = '';    // EMMA WALLET
    //passwordTextEditor.text = '';
  }

  void togglePasswordBtn() {
    passwordVisible = !passwordVisible;
    update();
  }
  void toggleRememberMeBtn() {
    isRemembered = !isRemembered;
    update();
  }

  void toggleCircleBtn() {
    isChecked = !isChecked;
    update();
  }
  Future<void> launchUrlPX(var url) async {
    print('launch URL : $url');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  showAlertBox( String mTitle, String mMessage) {
    var context = Get.context as BuildContext;
    Alert(
      context: context,
      type: AlertType.info,
      title: mTitle??'',
      desc: mMessage??'',
      buttons: [
        DialogButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          width: 120,
          child:  const Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }




  /// Login User
  Future<void> loginUser (String username, String password) async {
    var context = Get.context as BuildContext;
    print('Signing .... ');
    EasyLoading.show(status: 'Signing in...');


    AppServices().checkInternet().then((hasInternet) async {
      if (!hasInternet!) {
        //_btnController.reset();
        EasyLoading.dismiss();
        onAlertError(context, 'no internet Connection');
        // openSnacbar(context, 'no internet'.tr());
      } else {

        String responseData;
        try{
           responseData = await AuthenticationRepository.instance.loginWithEmailAndPassword(username, password);
           print("responseData -->${responseData}");
           if(responseData =="01"){
             EasyLoading.dismiss();
             Get.toNamed(AppRouter.getHomeRoute());
           }else{
             EasyLoading.dismiss();
             showToast(responseData);
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


  /*///Firebase Login
  Future<String> LogincreateUserWithEmailAndPassword(
      String email, String password) async {
    final ex ;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(firebaseUser.value != null){
        return "01";
      }else {
        // Get.to(AppRouter.getWelcomeRoute());
        return "100";
      }
    } on FirebaseException catch (e) {
      ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");

      throw ex;
    } catch (e) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
  }*/




}
