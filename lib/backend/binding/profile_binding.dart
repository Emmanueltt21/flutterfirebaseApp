/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/controller/profile_controller.dart';

import '../../controller/settings_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ProfileController(parser: Get.find()),
    );
  }
}
