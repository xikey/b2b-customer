import 'package:b2b_customer/config/colors.dart';
import 'package:flutter/material.dart';

class ColorfulBackgroundWidget extends StatelessWidget {
  const ColorfulBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          AppColors.yadegar_1,
          AppColors.yadegar_1,
          AppColors.yadegar_1,
          AppColors.yadegar_1,
          AppColors.yadegar_1,

        ],
      )),
    );
  }
}
