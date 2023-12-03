import 'package:b2b_customer/config/colors.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.appGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.search_rounded,
                color: AppColors.appGreyDarker,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "جستجو در ",
                style: TextStyle(color: AppColors.appGreyDarker),
              ),
              Image.asset(
                'assets/images/img_yadegar_text_farsi_colored_small.png',
                width: 50,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
