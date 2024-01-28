import 'package:b2b_customer/common/utils/logger.dart';
import 'package:b2b_customer/common/widgets/zikey_image_view.dart';
import 'package:flutter/material.dart';

class ProductPictureWidget extends StatelessWidget {
  const ProductPictureWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double smallSide = constraints.maxWidth;
      if (smallSide > constraints.maxHeight) smallSide = constraints.maxHeight;

      return Center(
          child: SizedBox(
        width: smallSide,
        height: smallSide,
            child: ZikeyImageView(imageUrl: imageUrl,),
      ));
    });
  }
}
