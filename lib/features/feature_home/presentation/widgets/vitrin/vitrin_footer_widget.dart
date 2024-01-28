import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/vitrin/vitrin_footer_item_widget.dart';
import 'package:flutter/material.dart';

class VitrinFooterWidget extends StatelessWidget {
  const VitrinFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.yadegar_1,
      height: 200,
      padding: const EdgeInsets.all(20),
      child: Center(
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VitrinFooterItemWidget(
              iconData: Icons.groups,
              title: '+300'
                  '',
              subTitle: 'افتخوار داریم به داشتن نیروهای مجرب جهت ارائه بهترین خدمات به مشتریان گرانقدر ',
            ),

            VitrinFooterItemWidget(
              iconData: Icons.public_rounded,
              title: '+3000'
                  '',
              subTitle: 'شرکت یادگار پخش بزرگترین شرکت پخش استان گیلان',
            ),

            VitrinFooterItemWidget(
              iconData: Icons.fire_truck_rounded,
              title: '+20'
                  '',
              subTitle: 'به لطف ناوگان پخش حرفه ای در سریع ترین زمان ممکن سفارشات شما تحویل شما داده خواهد شد',
            )
          ],
        ),
      ),
    );
  }
}
