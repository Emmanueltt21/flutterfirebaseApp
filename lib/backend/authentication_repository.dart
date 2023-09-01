import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pay_with_flutter_wordpress/screens/home/home_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/splash/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../backend/model/user_model.dart';



import '../helper/router.dart';
import 'exceptions/TExceptions.dart';
import 'exceptions/signup_email_password_failure.dart';



class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = "".obs;
  final _db = FirebaseFirestore.instance;

 // User? get firebaseUser => _firebaseUser.value;


  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
   // ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.toNamed(AppRouter.getWelcomeRoute())
        : Get.toNamed(AppRouter.getHomeRoute());
  }

  ///Firebase Send OTP Code to PhoneNumber
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar("Error", "The provider phone number is not valid.");
        } else {
          Get.snackbar("Error", "Someting went wrong. Try again.");
        }
      },
    );
  }

  ///Firebase Confirmed OTP received
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      ),
    );
    return credentials.user != null ? true : false;
  }

  ///Firebase Create User With Email
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      {}
    } on FirebaseException catch (e) {
    } catch (e) {}
  }


  ///Firebase Login
  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    print("loginWithEmailAndPassword -");
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(firebaseUser.value != null){
        return "01";
      }else {
        // Get.to(AppRouter.getWelcomeRoute());
        return "100";
      }
    } on FirebaseException catch (e) {
      print("Except - ${e}");
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      throw ex;
    } catch (e) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
  }

  ///Firebase LogOut
  Future<void> logout() async => await _auth.signOut();

  ///FireStore Create Account
  createUserFirebase(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Akun berhasil di buat.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green),
    )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Terdeteksi Error. Silahkan Coba lagi",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  /// Firebase Send Email Verification
  Future<void> sendEmailVerification() async {
    print('sendEmailVerification ----> ');
    try {
      _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    }catch(_){
      const ex = TExceptions();
      throw ex.message;
    }
  }

}
