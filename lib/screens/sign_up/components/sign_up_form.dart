import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/components/custom_surfix_icon.dart';
import 'package:pay_with_flutter_wordpress/components/default_button.dart';
import 'package:pay_with_flutter_wordpress/components/form_error.dart';
import 'package:pay_with_flutter_wordpress/controller/signup_controller.dart';
import 'package:pay_with_flutter_wordpress/screens/complete_profile/complete_profile_screen.dart';

import '../../../backend/model/user_model.dart';
import '../../../constants.dart';
import '../../../helper/router.dart';
import '../../../size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pay_with_flutter_wordpress/services/app_services.dart';
import 'package:pay_with_flutter_wordpress/services/auth_service.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? username;
  String? password;
  String? phoneNumber;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

/*
  Future<void> createUserAccOLD() async {
    print('createUserAcc .... ');
    EasyLoading.show(status: 'Creating Account...');

    AppServices().checkInternet().then((hasInternet) async {
      if (!hasInternet!) {
        //_btnController.reset();
        EasyLoading.dismiss();
        onAlertError(context, 'no internet Connection');
       // openSnacbar(context, 'no internet'.tr());
      } else {
        UserModel userModel = UserModel(
          userName: username?.trim(),
          emailId: email,
          password: password,
        );
        print('User username -->> ${username}');
        print('User email -->> ${email}');
        print('User password -->> ${password}');
        try{
          await AuthService.createUser(userModel).then((UserResponseModel response) async{
            if(response.code == 200){
              */
/*await ub.guestUserSignout()
                .then((value) => ub.saveUserData(userModel))
                .then((value) => ub.setSignIn()).then((value){

              EasyLoading.showSuccess('Welcome!');
              EasyLoading.dismiss();
              afterSignUp();
            });*//*

              */
/***
               * Save User Data in pref
               *//*

              print(response);
              EasyLoading.showSuccess('Welcome!');
              EasyLoading.dismiss();
              afterSignUp();

            }else{
              //_btnController.reset();
              print(response);
              EasyLoading.dismiss();
              onAlertError(context, response.message.toString());
              //openSnacbar(context, response.message);
            }
          });

        }catch(e){
          EasyLoading.dismiss();
          print("Exception -->> \n");
          print(e);
          onAlertError(context, e.toString());

        }
      }
    });

  }
*/


/*
  Future<void> createUserAcc(SignUpController controller) async {
    print('createUserAcc .... ');
    EasyLoading.show(status: 'Creating Account...');

    AppServices().checkInternet().then((hasInternet) async {
      if (!hasInternet!) {
        //_btnController.reset();
        EasyLoading.dismiss();
        onAlertError(context, 'no internet Connection');
       // openSnacbar(context, 'no internet'.tr());
      } else {

        try{
          */
/**
           *  required this.fullName,
              required this.email,
              required this.phoneNo,
              required this.password,
           *//*

         await controller.createUser(userModel);
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
*/

  void afterSignUp(){
    //Navigator.pushNamedX(context, CompleteProfileScreen.routeName);
    Get.toNamed(AppRouter.getCompProfile());
  }
  // Alert with single button.
/*
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
  }
*/



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(16)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(16)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(16)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(16)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                UserModel userModel = UserModel(
                  fullName: username?.trim(),
                  email: email,
                  phoneNo: "+237${phoneNumber?.trim()}",
                  password: password,
                );
                controller.createUser(userModel);
              }
            },
          ),
        ],
      ),
    );
    });
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "User Name",
        hintText: "Enter your Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "PhoneNumber",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
