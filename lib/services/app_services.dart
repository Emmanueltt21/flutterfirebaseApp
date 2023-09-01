
 import 'dart:io';
import 'package:flutter/cupertino.dart';

class AppServices{


   Future<bool?> checkInternet() async {
     bool? internet;
     try {
       final result = await InternetAddress.lookup('google.com');
       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
         debugPrint('connected');
         internet = true;
       }
     } on SocketException catch (_) {
       debugPrint('not connected');
       internet = false;
     }
     return internet;
   }






 }