import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/controller/login_controller.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
    });
  }
}
