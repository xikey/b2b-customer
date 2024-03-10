import 'package:flutter/material.dart';

Widget buildRichText(
  String label,
  String value,
  BuildContext context, {
  double fontSize = 14,
  Color color = Colors.black,
}) {
  return RichText(
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(
          text: '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            overflow: TextOverflow.ellipsis,
            color: color,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            overflow: TextOverflow.ellipsis,
          ),
          // Truncate text with an ellipsis
        ),
      ],
    ),
  );
}
