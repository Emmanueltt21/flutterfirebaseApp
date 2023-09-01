import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/components/coustom_bottom_nav_bar.dart';
import 'package:pay_with_flutter_wordpress/enums.dart';

import '../../controller/profile_controller.dart';
import 'components/body.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  });
  }
}
