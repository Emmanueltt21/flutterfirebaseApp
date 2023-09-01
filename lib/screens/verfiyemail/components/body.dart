import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/constants.dart';
import 'package:pay_with_flutter_wordpress/controller/emailVerify_controller.dart';
import 'package:pay_with_flutter_wordpress/size_config.dart';

import '../../../components/default_button.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailVerifyController>(builder: (controller) {

      return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Email Verification",
                style: headingStyle,
              ),
              Text("We have just send email verifcation link on \n your "
                  "email. Please check email and click on \n that link to verify your "
                  "Email Address."),

              SizedBox(height: 16,),
              Text('if not auto redirected after verification, \n click'
                  'on the Continue Button.'),
              buildTimer(),
              SizedBox(height: 16,),
              DefaultButton(
                text: "Continue",
                press: () {
                  controller.validVerificationManually();
                },
              ),
              SizedBox(height: 16,),

              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                  controller.sendEmailV();
                },
                child: Text(
                  "Resend E-Mail Link",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
    });
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
