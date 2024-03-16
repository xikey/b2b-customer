import 'package:b2b_customer/config/colors.dart';
import 'package:flutter/material.dart';

class LoginDetailWidget extends StatelessWidget {
  const LoginDetailWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.yadegar_1,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: EdgeInsets.all(150),
              child: Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    'assets/images/img_yadegar_text_farsi_white.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
