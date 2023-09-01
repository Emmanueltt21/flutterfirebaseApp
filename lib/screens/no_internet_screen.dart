/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/constants.dart';

import '../helper/router.dart';

class NoInternetScreen extends StatefulWidget {

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool finishLoading = true;

  void checkInternetAccess(){

    Get.back();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center, width: 280,
          child: Stack(
            children: <Widget>[
              finishLoading ?
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("AppConstants.noInternetAccessImage", width: 250, height: 250),
                  const Text("Whoops!", style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20
                  )),
                  Container(height: 10),
                  Text("No internet connections found. Check your connection or try again",
                      textAlign: TextAlign.center, style: TextStyle(color: kPrimaryColor,  fontSize: 16)
                  ),
                  Container(height: 25),
                  Container(
                    width: 180, height: 40,
                    child: MaterialButton(
                      child: Text("RETRY", style: TextStyle(color: Colors.white,  fontSize: 16)), color:kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: () {
                        setState(() {
                          finishLoading = false;
                        });
                        delayShowingContent();
                      },
                    ),
                  )
                ],
              ) : CircularProgressIndicator(),
            ],
          ),
        ),
      )
    );
  }

  void delayShowingContent(){
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        finishLoading = true;
        checkInternetAccess();
      });
    });
  }
}


