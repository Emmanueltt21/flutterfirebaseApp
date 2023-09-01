/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/helper/router.dart';
import 'package:pay_with_flutter_wordpress/utils/toast.dart';

import '../backend/api/handler.dart';
import '../backend/parse/profile_parse.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



class ProfileController extends GetxController implements GetxService {
  final ProfileParser parser;
  String orderId = '';
  bool apiCalled = false;
  RxBool isLogin = false.obs;
  // Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = "".obs;




  ProfileController({required this.parser});

  @override
  void onInit() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    super.onInit();

  }
  Future<void> logout() async {
    print('Logging out user ....');
    await _auth.signOut();
    Get.toNamed(AppRouter.getLoginRoute());
    showToast("You've been Logged Out ");
  }

  Future<void> getAppointmentById() async {

  }

  Future<void> getOrderDetails() async {

  }

  Future<void> onIssueModal() async {
    var context = Get.context as BuildContext;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Choose Issue With'.tr,
              style: const TextStyle(fontSize: 14, fontFamily: 'bold'),
              textAlign: TextAlign.center,
            ),
            content: Column(
              children: [
                /*SizedBox(
                  height: 200.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: Scrollbar(
                    *//*child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: issueWithList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Color getColor(Set<MaterialState> states) {
                          return ThemeProvider.appColor;
                        }

                        return ListTile(
                          textColor: ThemeProvider.appColor,
                          iconColor: ThemeProvider.appColor,
                          title: Text(issueWithList[index].name.toString()),
                          leading: Radio(
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: issueWithList[index].id.toString(),
                              groupValue: issueWith,
                              onChanged: (e) {
                                issueWith = e.toString();
                                var selected = issueWithList
                                    .firstWhere((element) =>
                                        element.id.toString() == issueWith)
                                    .name;
                                issueWithText = selected!;
                                update();
                                Navigator.pop(context);
                              }),
                        );
                      },
                    ),*//*
                  ),
                ),*/
              ],
            ),
          );
        });
  }


  Future<void> onServiceModal() async {
    var context = Get.context as BuildContext;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Choose Service'.tr,
              style: const TextStyle(fontSize: 14, fontFamily: 'bold'),
              textAlign: TextAlign.center,
            ),
            content: Column(
              children: [
                /*SizedBox(
                  height: 200.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: appointmentDetail.items!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Color getColor(Set<MaterialState> states) {
                          return ThemeProvider.appColor;
                        }

                        return ListTile(
                          textColor: ThemeProvider.appColor,
                          iconColor: ThemeProvider.appColor,
                          title: Text(
                              appointmentDetail.items![index].name.toString()),
                          leading: Radio(
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value:
                                  appointmentDetail.items![index].id.toString(),
                              groupValue: serviceId,
                              onChanged: (e) {
                                serviceId = e.toString();
                                serviceName = appointmentDetail.items!
                                    .firstWhere((element) =>
                                        element.id.toString() == serviceId)
                                    .name
                                    .toString();
                                update();
                                Navigator.pop(context);
                              }),
                        );
                      },
                    ),
                  ),
                ),*/
              ],
            ),
          );
        });
  }

  Future<void> onProductModal() async {
    var context = Get.context as BuildContext;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Choose Product'.tr,
              style: const TextStyle(fontSize: 14, fontFamily: 'bold'),
              textAlign: TextAlign.center,
            ),
            content: Column(
              children: [
               /* SizedBox(
                  height: 200.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: details.orders!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Color getColor(Set<MaterialState> states) {
                          return ThemeProvider.appColor;
                        }

                        return ListTile(
                          textColor: ThemeProvider.appColor,
                          iconColor: ThemeProvider.appColor,
                          title: Text(details.orders![index].name.toString()),
                          leading: Radio(
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: details.orders![index].id.toString(),
                              groupValue: productId,
                              onChanged: (e) {
                                productId = e.toString();
                                productName = details.orders!
                                    .firstWhere((element) =>
                                        element.id.toString() == productId)
                                    .name
                                    .toString();
                                update();
                                Navigator.pop(context);
                              }),
                        );
                      },
                    ),
                  ),
                ),*/
              ],
            ),
          );
        });
  }

  Future<void> onImageModal() async {
    var context = Get.context as BuildContext;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Choose From'.tr),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text('Gallery'.tr),
            onPressed: () {
              Navigator.pop(context);
              selectFromGallery('Gallery'.tr);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'.tr),
            onPressed: () {
              Navigator.pop(context);
              selectFromGallery('Camera'.tr);
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Cancel'.tr,
              style: const TextStyle(fontFamily: 'bold', color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void selectFromGallery(String kind) async {
  }

  void onBack() {
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }
}
