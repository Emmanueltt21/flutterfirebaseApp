/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';

//import '../../controller/account_controller.dart';
import '../../helper/router.dart';
import '../../utils/toast.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      showToast('Session expired!'.tr);
      //Get.find<AccountController>().cleanData();
      Get.toNamed(AppRouter.getLoginRoute(), arguments: ['account']);
    } else {
      showToast(response.statusText.toString().tr);
    }
  }
}
