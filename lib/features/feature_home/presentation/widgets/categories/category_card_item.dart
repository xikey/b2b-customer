import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/category.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/zikey_image_view.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem(
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
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: width,
                height: width,
                margin: const EdgeInsets.all(12),
                child: Center(
                  child: ZikeyImageView(
                    borderRadius: 10,
                    imageUrl: category.getImageUrl(),
                  ),
                ),
              ),
              Container(
                color: AppColors.appGrey,
                width: width,
                height: 2,
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
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
