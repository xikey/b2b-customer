import 'package:flutter/material.dart';

Widget buildRichText(String label, String value,BuildContext context) {
  return RichText(
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(
          text: '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: value),
      ],
    ),
  );
}