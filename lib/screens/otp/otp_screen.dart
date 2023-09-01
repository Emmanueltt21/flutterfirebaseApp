import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/size_config.dart';

import '../../controller/otp_controller.dart';
import 'components/body.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<OTPController>(builder: (controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  });
  }
}
