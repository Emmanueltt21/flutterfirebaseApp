/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../controller/signup_controller.dart';

class SingUpBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SignUpController(parser: Get.find()),
    );
  }
}


