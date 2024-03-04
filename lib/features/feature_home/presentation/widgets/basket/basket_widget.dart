import 'package:b2b_customer/common/resources/data_state.dart';
import 'package:b2b_customer/common/utils/basket.dart';
import 'package:b2b_customer/common/utils/toasty.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/basket/basket_items_widget.dart';
import 'package:b2b_customer/features/feature_product/data/model/basket_item.dart';
import 'package:b2b_customer/features/feature_product/data/model/order.dart';
import 'package:b2b_customer/features/feature_product/data/model/payment_type.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../../common/params/result/finalize_basket_dialog_result.dart';
import '../../../../../common/widgets/dot_loading_widget.dart';
import '../../../../../common/widgets/finalize_basket_dialog.dart';
import '../../../../../common/widgets/rich_text_builder.dart';
import '../../../../feature_product/presentation/cubit/product_cubit.dart';

import 'package:uuid/uuid.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BasketItem> items = [];
    String? comment;
    PaymentType? paymentType;

    BlocProvider.of<ProductCubit>(context).getBasketProducts();

    void createAndSendOrder() {
      if (paymentType == null) {
        ZikeyToast()
            .showSnackBarInfo(context, 'ابتدا نحوه پرداخت را انتخاب نمایید');
        return;
      }

      int totalPrice = 0;
      for (var element in items) {
        int priceTemp =
            (element.orderCount * element.product.priceForoosh!).toInt();
        totalPrice += priceTemp;
      }

      final order = Order(
          orderedProducts: items,
          uuid: const Uuid().v4(),
          comment: comment ?? '',
          paymentType: paymentType!,
          totalPrice: totalPrice);

      BlocProvider.of<ProductCubit>(context).addOrder(order);
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Card(
        child: Column(
          children: [
            Expanded(
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

                if (state.productStatus is AddOrderStatus) {
                  final status = state.productStatus as AddOrderStatus;
                  if (status.dataState is DataFailed) {
                    ZikeyToast().showSnackBarError(
                        context, status.dataState.error.toString());
                  } else {
                    if (status.dataState.data == null ||
                        status.dataState.data!.success == 0) {
                      ZikeyToast().showSnackBarError(
                          context, status.dataState.data!.error);
                    } else {
                      locator<Basket>().clearBasket();
                      comment = null;
                      paymentType = null;
                      items=[];
                      ZikeyToast().showSnackBarSuccess(
                          context, "سفارشات شما با موفقیت ثبت گردید.");

                      BlocProvider.of<ProductCubit>(context).reloadBasketBudge();
                      BlocProvider.of<ProductCubit>(context).getBasketProducts();
                    }
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
                  for (var element in items) {
                    int priceTemp =
                        (element.orderCount * element.product.priceForoosh!)
                            .toInt();
                    totalPrice += priceTemp;
                  }
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
                                if(items.isEmpty){
                                  ZikeyToast().showSnackBarInfo(context, 'سبد خرید شما خالی میباشد');
                                  return;
                                }
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const FinalizeBasketDialog();
                                  },
                                ).then((value) {
                                  if (value is FinalizeBasketDialogResult) {
                                    paymentType = value.paymentType;
                                    comment = value.comment;
                                    createAndSendOrder();
                                  }
                                });
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
            )),
          ],
        ),
      ),
    );
  }
}
