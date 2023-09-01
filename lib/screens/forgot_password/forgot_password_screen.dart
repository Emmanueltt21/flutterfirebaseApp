import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/controller/forgot_password_controller.dart';

import 'components/body.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
    });
  }
}
