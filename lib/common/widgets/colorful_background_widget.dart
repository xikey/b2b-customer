import 'package:flutter/material.dart';

class ColorfulBackgroundWidget extends StatelessWidget {
  const ColorfulBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0x300081C9),
          Color(0x30000000),
          Color(0x30000000),
          Color(0x30000000),
          Color(0x30000000),
          Color(0x30FFFF00),
        ],
      )),
    );
  }
}
