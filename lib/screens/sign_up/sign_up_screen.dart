import 'package:flutter/material.dart';

import '../../controller/signup_controller.dart';
import 'components/body.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
    });
  }
}
