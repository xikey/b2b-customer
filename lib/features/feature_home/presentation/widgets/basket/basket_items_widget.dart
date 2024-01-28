import 'package:b2b_customer/features/feature_home/presentation/widgets/basket/basket_card_item.dart';
import 'package:b2b_customer/features/feature_product/data/model/basket_item.dart';
import 'package:b2b_customer/features/feature_product/data/model/ordered_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/add_to_basket_widget.dart';
import '../../../../feature_product/presentation/cubit/product_cubit.dart';

class BasketItemsWidget extends StatelessWidget {
  const BasketItemsWidget({Key? key, required this.basketItems})
      : super(key: key);

  final List<BasketItem> basketItems;

  @override
  Widget build(BuildContext buildContext) {
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
                    return BasketCardItem(
                      basketItem: basketItems[index],
                      onTapEdit: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddToBasketDialog(
                              product: basketItems[index].product,
                              orderedProduct: OrderedProduct(
                                productId: basketItems[index].product.id,
                                orderCount: basketItems[index].orderCount,
                              ),
                            );
                          },
                        ).then((value) {
                          BlocProvider.of<ProductCubit>(buildContext)
                              .getBasketProducts();
                          BlocProvider.of<ProductCubit>(buildContext)
                              .reloadBasketBudge();
                        });
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                        height: 2,
                        color: Colors.black12,
                      ),
                  itemCount: basketItems.length),
        )),
      ],
    );
  }
}
