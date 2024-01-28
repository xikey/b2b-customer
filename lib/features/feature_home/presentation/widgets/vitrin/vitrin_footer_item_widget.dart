import 'package:flutter/material.dart';

class VitrinFooterItemWidget extends StatelessWidget {
  const VitrinFooterItemWidget({Key? key, required this.iconData, required this.title, required this.subTitle}) : super(key: key);

  final IconData iconData;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child:  Column(
        children: [
          Icon(iconData,size: 45,color: Colors.white,),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}
