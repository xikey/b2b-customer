import 'package:b2b_customer/features/feature_product/data/model/basket_item.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../../common/widgets/rich_text_builder.dart';
import '../../../../../common/widgets/zikey_image_view.dart';

class BasketCardItem extends StatelessWidget {
  const BasketCardItem({Key? key, required this.basketItem}) : super(key: key);

  final BasketItem basketItem;
  final double height = 100;

  @override
  Widget build(BuildContext context) {
    int price =
        (basketItem.orderCount * basketItem.product.priceForoosh!).toInt();
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white,
        height: height,
        child: Row(
          children: [
            Container(
              width: height,
              height: height,
              margin: const EdgeInsets.all(12),
              child: Center(
                child: ZikeyImageView(
                  borderRadius: 10,
                  imageUrl: basketItem.product.getImageUrl(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRichText("نام", basketItem.product.name, context,fontSize: 12),
                  buildRichText(
                      "فی",
                      basketItem.product.priceForoosh
                          .toString()
                          .seRagham(),
                      context,fontSize: 10),
                  buildRichText("تعداد",
                      basketItem.orderCount.toString().seRagham(), context,fontSize: 10),
                  buildRichText("تخفیف", "0".seRagham(), context,fontSize: 10),
                  buildRichText(
                      "مبلغ", price.toString().seRagham(), context,fontSize: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
