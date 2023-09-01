import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/components/coustom_bottom_nav_bar.dart';
import 'package:pay_with_flutter_wordpress/controller/home_controller.dart';
import 'package:pay_with_flutter_wordpress/enums.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
    });
  }
}
