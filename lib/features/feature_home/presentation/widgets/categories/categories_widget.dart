import 'package:b2b_customer/common/resources/data_state.dart';
import 'package:b2b_customer/common/utils/toasty.dart';
import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_home/presentation/widgets/categories/category_card_item.dart';
import 'package:b2b_customer/features/feature_product/data/model/category.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/presentation/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../common/params/args/products_screen_args.dart';
import '../../../../../common/widgets/dot_loading_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [];
    BlocProvider.of<ProductCubit>(context).getAllCategories();
    return BlocConsumer<ProductCubit, ProductState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.productStatus is GetCategoriesStatus) {
          final status = state.productStatus as GetCategoriesStatus;
          if (status.dataState is DataSuccess) {
            final data = status.dataState as DataSuccess;
            if (data.data != null) {
              categories = data.data;
            }
          } else {
            ZikeyToast().showSnackBarError(
                context, "خطا در دریافت اطلاعات دسته بندی محصولات");
          }
        }
      },
      builder: (context, state) {
        if (state.productStatus is LoadingStatus) {
          return const DotLoadingWidget(size: 40);
        }

        if (categories.isNotEmpty) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double cardWidth = 200;
            double cardHeight = 300;
            double pageWidth = constraints.maxWidth;

            if (pageWidth < 400) {
              cardWidth = 150;
              cardHeight = 200;
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
                itemCount: categories.length,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return CategoryCardItem(
                    width: cardWidth,
                    category: categories[index],
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ProductsScreenProvider.routeName,
                              arguments: ProductsScreenArgs(
                                  category: categories[index]))
                          .then((value) =>
                              BlocProvider.of<ProductCubit>(context)
                                  .reloadBasketBudge());
                    },
                  );
                },
              ),
            );
          });
        } else {
          return (const Center(
            child: Text("گروه محصول یافت نشد!"),
          ));
        }
        return (const Center(
          child: Text("Error!"),
        ));
      },
    );
  }
}
