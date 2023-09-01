import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/routes.dart';
import 'package:pay_with_flutter_wordpress/screens/profile/profile_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/sign_in/sign_in_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/splash/splash_screen.dart';
import 'package:pay_with_flutter_wordpress/services/wp_config.dart';
import 'package:pay_with_flutter_wordpress/theme.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:get/get.dart';


import 'constants.dart';
import 'firebase_options.dart';
import 'helper/init.dart';
import 'helper/router.dart';


void main() async {

 //  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MainBinding().dependencies();
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.custom
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  // ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorColor = Colors.white
    ..progressColor = Colors.white
    ..backgroundColor = kPrimaryColor
    ..maskColor = Colors.white54
    ..textColor = Colors.white
    ..userInteractions = true
    ..dismissOnTap = false ;
  //..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WooPay',
      theme: theme(),
      builder: EasyLoading.init(),
      navigatorKey: Get.key,
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
     // initialRoute: SplashScreen.routeName,
    //  routes: routes,
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        //  final isValidHost = ["154.72.156.106"].contains(host); // <-- allow only hosts in array
        final isValidHost = [WpConfig.websiteUrl].contains(host); // <-- allow only hosts in array
        //return true;
        return isValidHost;
      });
  }
}
