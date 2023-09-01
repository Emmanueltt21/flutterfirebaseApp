import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/components/default_button.dart';
import 'package:pay_with_flutter_wordpress/controller/otp_controller.dart';
import 'package:pay_with_flutter_wordpress/size_config.dart';

import '../../../constants.dart';
import 'package:get/get.dart';

import '../../../services/app_services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;
  String  mCode1 = "", mCode2 = "", mCode3 ="", mCode4 = "", mCode5 ="", mCode6 ="";

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OTPController>(builder: (controller) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                    mCode1= value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                    mCode2= value;
                    },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value)  {
                    nextField(value, pin4FocusNode);
                     mCode3= value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      nextField(value, pin5FocusNode);
                      mCode4= value;
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),  SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      nextField(value, pin6FocusNode);
                      mCode5= value;
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),  SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      mCode6 = value;
                      pin6FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              print('CodeOTP --> ${ mCode1 + mCode2+ mCode3 + mCode4 + mCode5 + mCode6 }');
              String valueOtp = '${mCode1 + mCode2+ mCode3 + mCode4 + mCode5 + mCode6}';
              controller.validateOTP(valueOtp);
            },
          )
        ],
      ),
    );
    });
  }
/*
  Future<void> verifyOTP(String valueOtp) async {
    print('createUserAcc .... ');
    EasyLoading.show(status: 'Verify Phone...');

    AppServices().checkInternet().then((hasInternet) async {
      if (!hasInternet!) {
        //_btnController.reset();
        EasyLoading.dismiss();
        onAlertError(context, 'no internet Connection');
        // openSnacbar(context, 'no internet'.tr());
      } else {

        try{
            OTPController.instace.verifyOTP(valueOtp);
          EasyLoading.dismiss();

        }catch(e){
          EasyLoading.dismiss();
          print("Exception -->> \n");
          print(e);
          onAlertError(context, e.toString());

        }
      }
    });

  }

  onAlertError(context, String paramMessage) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "ALERT",
      desc: paramMessage,
      buttons: [
        DialogButton(
          onPressed: (){
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }*/

}
