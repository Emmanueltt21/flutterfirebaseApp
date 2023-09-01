/*
  Authors : iwomi (Taah Emmanuel)
  App Name : GIMAC App

*/
import 'package:get/get.dart';
import 'package:pay_with_flutter_wordpress/backend/binding/Otp_binding.dart';
import 'package:pay_with_flutter_wordpress/screens/complete_profile/complete_profile_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/details/details_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/forgot_password/forgot_password_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/home/home_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/otp/otp_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/profile/profile_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/sign_in/sign_in_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/sign_up/sign_up_screen.dart';
import 'package:pay_with_flutter_wordpress/screens/verfiyemail/verifyemail_screen.dart';

import '../backend/binding/forgot_password_binding.dart';
import '../backend/binding/home_binding.dart';
import '../backend/binding/login_binding.dart';
import '../backend/binding/profile_binding.dart';
import '../backend/binding/signup_binding.dart';
import '../backend/binding/splash_binding.dart';
import '../backend/binding/welcome_binding.dart';
import '../screens/no_internet_screen.dart';
import '../screens/splash/splash_screen.dart';


class AppRouter {
  static const String initial = '/';
  static const String intro = '/intro';
  static const String errorRoutes = '/error';
  static const String welcome = '/welcome';
  static const String register = '/register';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String tabs = '/tabs';
  static const String home = '/home';
  static const String account = '/account';
  static const String language = '/language';
  static const String contactus = '/contactus';
  static const String appPage = '/appPage';
  static const String complaintsRoutes = '/complaints';
  static const String myprofile = '/profile';
  static const String completeprofile = '/completeprofile';
  static const String detailspage = '/detailspage';
  static const String signup = '/signup';
  static const String otpscreen = '/otpscreen';
  static const String verifyEmail = '/verifyEmail';



  static String getInitialRoute() => initial;
  static String getIntroRoutes() => intro;
  static String getErrorRoutes() => errorRoutes;
  static String getWelcomeRoute() => welcome;
  static String getRegisterRoute() => register;
  static String getLoginRoute() => login;
  static String getForgotPasswordRoute() => forgotPassword;
  static String getTabsRoute() => tabs;
  static String getHomeRoute() => home;
  static String getAccountRoute() => account;
  static String getLanguageRoute() => language;
  static String getContactUsRoute() => contactus;
  static String getAppPageRoute() => appPage;
  static String getComplaintsRoutes() => complaintsRoutes;
  static String getProfile() => myprofile;
  static String getCompProfile() => completeprofile;
  static String getDetailsPage() => detailspage;
  static String getSignUpScreen() => signup;
  static String getOtpScreen() => otpscreen;
  static String getVerifyEmail() => verifyEmail;




  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () =>  SplashScreen(),
        binding: SplashBinging()),
    GetPage(
        name: errorRoutes,
        page: () => NoInternetScreen()),
    GetPage(
        name: completeprofile,
        page: () =>  CompleteProfileScreen(),
        binding: WelcomeBindings()),

    GetPage(
      name: login,
      page: () =>  SignInScreen(),
      binding: LoginBindings(),
    ) ,
    GetPage(
      name: forgotPassword,
      page: () =>  ForgotPasswordScreen(),
      binding: ForgotPasswordBindings(),
    ),

    GetPage(
      name: home,
      page: () =>  HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: detailspage,
      page: () =>  DetailsScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: myprofile,
      page: () =>  ProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: signup,
      page: () =>  SignUpScreen(),
      binding: SingUpBindings(),
    ),
    GetPage(
      name: otpscreen,
      page: () =>  OtpScreen(),
      binding: OtpBindings(),
    ),
    GetPage(
      name: verifyEmail,
      page: () =>  VerifyEmailScreen(),
      binding: OtpBindings(),
    ),


  ];
}
