import 'package:b2b_customer/config/colors.dart';
import 'package:flutter/material.dart';

class LoginDetailWidget extends StatelessWidget {
  const LoginDetailWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Opacity(
          opacity: 0.9,
          child: Image.asset(
            'assets/images/yadegar_map.jpg',
            fit: BoxFit.cover,
          )),
    );
  }
}
