import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/category.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/zikey_image_view.dart';

class CategoryCardVitrinItem extends StatelessWidget {
  const CategoryCardVitrinItem(
      {Key? key,
      required this.width,
      required this.category,
      required this.onTap})
      : super(key: key);

  final double width;

  final Category category;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            width: width,
            height: width,
            margin: const EdgeInsets.all(1),
            child: Center(
              child: InkWell(
                onTap: onTap,
                child: ZikeyImageView(
                  borderRadius: 50,
                  imageUrl: category.getImageUrl(), width: width, height: width,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 50,
            child: Center(
                child: Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            )),
          )
        ],
      ),
    );
  }
}
