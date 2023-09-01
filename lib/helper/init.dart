/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/backend/parse/otp_parse.dart';
import 'package:pay_with_flutter_wordpress/backend/parse/profile_parse.dart';
import 'package:pay_with_flutter_wordpress/backend/user_repository.dart';
import 'package:pay_with_flutter_wordpress/controller/otp_controller.dart';

import 'package:pay_with_flutter_wordpress/helper/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/api/api.dart';
import '../backend/authentication_repository.dart';
import '../backend/parse/app_page_parse.dart';
import '../backend/parse/contactus_parse.dart';
import '../backend/parse/home_parse.dart';
import '../backend/parse/language_parse.dart';
import '../backend/parse/login_parse.dart';
import '../backend/parse/signup_parse.dart';
import '../backend/parse/splash_parse.dart';
import '../backend/parse/welcome_parse.dart';
import '../controller/home_controller.dart';
import '../services/wp_config.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final sharedPref = await SharedPreferences.getInstance();
    Get.put(SharedPreferencesManager(sharedPreferences: sharedPref), permanent: true,);

    Get.lazyPut(() => ApiService(appBaseUrl: WpConfig.websiteUrl));
    // Parser LazyLoad
    Get.lazyPut(() => AuthenticationRepository());
    Get.lazyPut(() => WelcomeParser(apiService: Get.find(), sharedPreferencesManager: Get.find()), fenix: true);
    Get.lazyPut(() => LoginParser(apiService: Get.find(), sharedPreferencesManager: Get.find()), fenix: true);
    Get.lazyPut(() => HomeParser(apiService: Get.find(), sharedPreferencesManager: Get.find()), fenix: true);
    Get.lazyPut(() => AppPageParser(apiService: Get.find(), sharedPreferencesManager: Get.find()), fenix: true);
    Get.lazyPut(() => LanguageParser(apiService: Get.find(), sharedPreferencesManager: Get.find()), fenix: true);
    Get.lazyPut(() => ContactUsParser(apiService: Get.find(), sharedPreferencesManager: Get.find()), fenix: true);
    Get.lazyPut(() => SplashScreenParse(sharedPreferencesManager: Get.find(), apiService: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => SignUpParser(sharedPreferencesManager: Get.find(), apiService: Get.find()), fenix: true);
    Get.lazyPut(() => ProfileParser(sharedPreferencesManager: Get.find(), apiService: Get.find()), fenix: true);
    Get.lazyPut(() => OtpParser(sharedPreferencesManager: Get.find(), apiService: Get.find()), fenix: true);

 //   Get.lazyPut(() => OTPController());


    //  Get.lazyPut(() => MyAccountsParser(sharedPreferencesManager: Get.find(), apiService: Get.find()), fenix: true);

  }
}
