/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../controller/splash_controller.dart';

class SplashBinging extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SplashScreenController(parser: Get.find()),
    );
  }
}
