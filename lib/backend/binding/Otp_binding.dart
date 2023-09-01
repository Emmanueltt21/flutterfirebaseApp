/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../controller/emailVerify_controller.dart';
import '../../controller/login_controller.dart';
import '../../controller/otp_controller.dart';
import '../../controller/signup_controller.dart';


class OtpBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => OTPController(parser: Get.find()),
    );Get.lazyPut(
      () => EmailVerifyController(parser: Get.find()),
    );
  }
}
