import 'package:flutter/material.dart';
import 'package:pay_with_flutter_wordpress/components/no_account_text.dart';
import 'package:pay_with_flutter_wordpress/components/socal_card.dart';
import '../../../size_config.dart';
import '../../home/components/home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //SizedBox(height: getProportionateScreenHeight(20)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
