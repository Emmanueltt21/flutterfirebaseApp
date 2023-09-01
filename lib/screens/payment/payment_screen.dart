import 'package:flutter/material.dart';

import 'components/body.dart';

class PaymentScreen extends StatelessWidget {
  static String routeName = "/paynow";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Make Payment ", style: TextStyle(color: Colors.grey.shade700),),
      ),
      body: Body(),
    );
  }
}
