/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../controller/forgot_password_controller.dart';

class ForgotPasswordBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ForgotPasswordController(parser: Get.find()),
    );
  }
}
