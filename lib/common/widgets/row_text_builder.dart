import 'package:flutter/material.dart';

Widget buildRowText(String label,
    String value,
    BuildContext context, {
      double fontSize = 14,
      Color color = Colors.black,
      MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start

    }) {
  return Row(
    mainAxisAlignment:mainAxisAlignment,
    children: [
      Text(
        '$label: ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          overflow: TextOverflow.ellipsis,
          color: color,
        ),
      ),
      Text(
        value,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ],
  );
}
