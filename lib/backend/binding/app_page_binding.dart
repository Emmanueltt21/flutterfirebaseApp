/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../controller/app_page_controller.dart';

class AppPageBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => AppPageController(parser: Get.find()),
    );
  }
}
