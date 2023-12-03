import 'package:b2b_customer/common/utils/logger.dart';
import 'package:b2b_customer/common/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';

import 'image_slider/image_slider.dart';

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
          child: Column(
        children: [
          SearchBarWidget(
            onTap: () {},
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double height = constraints.maxWidth / 3;
              if (height < 200) {
                height = 200;
              }
              if (height > 400) {
                height = 400;
              }
              ZikeyLogger.showLog("height", height.toString());
              return Container(
                color: Colors.white,
                child: ImageSlider(
                  hegiht: height,
                ),
              );
            },
          ),
          //   Text(name)
        ],
      )),
    );
  }
}
