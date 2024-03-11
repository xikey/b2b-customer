import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/order_history_item.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../common/widgets/rich_text_builder.dart';
import '../../../../common/widgets/zikey_image_view.dart';

class OrderItemCardWidget extends StatelessWidget {
  const OrderItemCardWidget({Key? key, required this.item, required this.width}) : super(key: key);

  final OrderHistoryItem item;
  final double height = 135;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
          children: [
            Container(
              color: AppColors.appGrey,
              width: height,
              height: height,
              margin: const EdgeInsets.all(12),
              child: Center(
                child: ZikeyImageView(
                  borderRadius: 10,
                  imageUrl: item.getImageUrl(), width: height, height: height,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRichText(
                    "نام کالا",
                    item.name,
                    context,
                    fontSize: 13,
                  ),
                  buildRichText(
                    "تعداد سفارش",
                    item.count.toString().seRagham(),
                    context,
                    fontSize: 13,
                  ),
                  buildRichText(
                    "فی",
                    item.fi.toString().seRagham(),
                    context,
                    fontSize: 13,
                  ),
                  buildRichText("مبلغ", item.price.toString().seRagham(), context,
                      fontSize: 13),
                ],
              ),
            ),
            Container(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
