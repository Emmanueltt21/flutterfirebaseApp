import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../helper/router.dart';
import '../size_config.dart';
import 'package:get/get.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
         // onTap: () => Navigator.pushNamedX(context, SignUpScreen.routeName),
          onTap: () => Get.toNamed(AppRouter.getSignUpScreen()),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
