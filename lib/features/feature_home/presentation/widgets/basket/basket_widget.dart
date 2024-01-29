import 'package:b2b_customer/common/resources/data_state.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/basket/basket_items_widget.dart';
import 'package:b2b_customer/features/feature_product/data/model/basket_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../../common/widgets/dot_loading_widget.dart';
import '../../../../../common/widgets/finalize_basket_dialog.dart';
import '../../../../../common/widgets/rich_text_builder.dart';
import '../../../../feature_product/presentation/cubit/product_cubit.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BasketItem> items = [];

    BlocProvider.of<ProductCubit>(context).getBasketProducts();

    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Card(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: BlocConsumer<ProductCubit, ProductState>(
                buildWhen: (previous, current) => previous != current,
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state.productStatus is GetBasketItems) {
                    final status = state.productStatus as GetBasketItems;

                    if (status.dataState is DataSuccess) {
                      items = status.dataState.data ?? [];
                    }
                  }
                },
                builder: (context, state) {
                  if (state.productStatus is LoadingStatus) {
                    return const Center(child: DotLoadingWidget(size: 40));
                  }

                  int totalPrice = 0;
                  int totalDiscountPrice = 0;

                  if (items.isNotEmpty) {
                    items.forEach((element) {
                      int priceTemp =
                          (element.orderCount * element.product.priceForoosh!)
                              .toInt();
                      totalPrice += priceTemp;
                    });
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: BasketItemsWidget(
                          basketItems: items,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 20, right: 30, left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildRichText("تخفیف نهایی", "0", context),
                                buildRichText(
                                    "مبلغ نهایی",
                                    "${totalPrice.toString().seRagham()} ریال",
                                    context),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const FinalizeBasketDialog(
                                                                  );
                                    },
                                  ).then((value) {});
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  fixedSize: const Size(double.infinity, 50),
                                  primary:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Center(
                                    child: Text(
                                  'ارسال سفارش',
                                  style: TextStyle(
                                      fontFamily: 'Estedad',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
