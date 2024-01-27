import 'package:b2b_customer/features/feature_home/presentation/widgets/basket/basket_card_item.dart';
import 'package:b2b_customer/features/feature_product/data/model/basket_item.dart';
import 'package:flutter/material.dart';


class BasketItemsWidget extends StatelessWidget {
  const BasketItemsWidget({Key? key, required this.basketItems})
      : super(key: key);

  final List<BasketItem> basketItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
            child: Center(
          child: basketItems.isEmpty
              ? const Center(
                  child: Text("سبد خرید شما خالی میباشد"),
                )
              : ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return BasketCardItem(basketItem: basketItems[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                        Container(height: 2,color: Colors.black12,),
                  itemCount: basketItems.length),
        )),

      ],
    );
  }
}
