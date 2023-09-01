/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SettingsController(parser: Get.find()),
    );
  }
}
