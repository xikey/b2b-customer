import 'package:flutter/material.dart';

Widget buildRichText(String label, String value,BuildContext context,{double fontSize=14}) {
  return RichText(
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(
          text: '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSize),
        ),
        TextSpan(text: value,style: TextStyle(fontSize: fontSize)),
      ],
    ),
  );
}