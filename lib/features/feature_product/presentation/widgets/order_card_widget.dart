import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/order_history.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../common/widgets/rich_text_builder.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget(
      {Key? key,
      required this.orderHistory,
      required this.onTap,
      required this.rowNum})
      : super(key: key);

  final OrderHistory orderHistory;
  final Function() onTap;
  final int rowNum;
  final double height = 135;

  @override
  Widget build(BuildContext context) {
    String vaziatTranslator(int vaziat) {
      if (vaziat == 1) {
        return 'فاکتور شده';
      } else {
        return 'در انتظار تایید';
      }
    }

    return InkWell(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          height: height,
          child: Row(
            children: [
              Container(
                color: AppColors.appGrey,
                width: height,
                height: height,
                margin: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    rowNum.toString(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.yadegar_1),
                  ),
                ),
              ),

              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRichText(
                    "تاریخ ثبت",
                    '${orderHistory.order_time}  ${orderHistory.order_date}',
                    context,
                    fontSize: 13,
                  ),
                  buildRichText(
                      "نحوه پرداخت", orderHistory.sharhNahveh.toString(), context,
                      fontSize: 13),
                  buildRichText("مبلغ",
                      orderHistory.rJamKol.toString().seRagham(), context,
                      fontSize: 13),
                  buildRichText(
                      "وضعیت", vaziatTranslator(orderHistory.vaziat), context,
                      fontSize: 13),
                  buildRichText("توضیحات", orderHistory.tozihat, context,
                      fontSize: 13),
                ],
              ),
              Container(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
