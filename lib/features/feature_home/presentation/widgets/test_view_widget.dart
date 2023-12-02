import 'package:flutter/material.dart';

class TestViewWidget extends StatelessWidget {
  const TestViewWidget({Key? key, required this.name, required this.color})
      : super(key: key);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(name),
      ),
    );
  }
}
