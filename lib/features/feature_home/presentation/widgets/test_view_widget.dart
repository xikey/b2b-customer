import 'package:b2b_customer/common/widgets/searchbar_widget.dart';
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
      height: 1000,
    );
  }
}
