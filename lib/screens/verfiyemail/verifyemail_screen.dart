import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/controller/emailVerify_controller.dart';
import 'package:pay_with_flutter_wordpress/size_config.dart';

import 'components/body.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<EmailVerifyController>(builder: (controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Verification"),
      ),
      body: Body(),
    );
  });
  }
}
