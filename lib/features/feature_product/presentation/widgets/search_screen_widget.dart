import 'package:b2b_customer/common/widgets/add_to_basket_widget.dart';
import 'package:b2b_customer/features/feature_product/data/model/category.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../common/params/args/product_screen_args.dart';
import '../../../../common/resources/data_state.dart';
import '../../../../common/utils/toasty.dart';
import '../../../../common/widgets/dot_loading_widget.dart';
import '../../../../config/colors.dart';
import '../cubit/product_cubit.dart';
import '../screen/product_screen.dart';

class SearchScreenWidget extends StatelessWidget {
  const SearchScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    List<Product> products = [];
    return BlocConsumer<ProductCubit, ProductState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.productStatus is GetProductsStatus) {
          final status = state.productStatus as GetProductsStatus;
          if (status.dataState is DataSuccess) {
            final data = status.dataState as DataSuccess;
            if (data.data != null) {
              products = data.data;
            }
          } else {
            ZikeyToast()
                .showSnackBarError(context, "خطا در دریافت اطلاعات  محصولات");
          }
        }
      },
      builder: (context, state) {
        if (state.productStatus is LoadingStatus) {
          return const DotLoadingWidget(size: 40);
        }

        if (products.isNotEmpty) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double cardWidth = 200;
            double pageWidth = constraints.maxWidth;

            if (pageWidth < 400) {
              cardWidth = 150;
            }

            double count = pageWidth / cardWidth;

            return Container(
              padding: const EdgeInsets.all(10),
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: AppColors.appGrey,
              child: AlignedGridView.count(
                crossAxisCount: count.toInt(),
                mainAxisSpacing: 4,
                itemCount: products.length,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return ProductCardItem(
                    width: cardWidth,
                    product: products[index],
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ProductScreenProvider.routeName,
                              arguments:
                                  ProductScreenArgs(product: products[index]))
                          .then((value) =>
                              BlocProvider.of<ProductCubit>(buildContext)
                                  .reloadBasketBudge());
                    },
                    addToBasket: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddToBasketDialog(
                            product: products[index],
                          );
                        },
                      ).then((value) =>
                          BlocProvider.of<ProductCubit>(buildContext)
                              .reloadBasketBudge());
                    },
                  );
                },
              ),
            );
          });
        } else {
          return (const Center(
            child: Text(" محصول یافت نشد!"),
          ));
        }
        return (const Center(
          child: Text("Error!"),
        ));
      },
    );
  }
}
