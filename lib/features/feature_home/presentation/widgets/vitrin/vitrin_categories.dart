import 'package:b2b_customer/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../common/params/args/products_screen_args.dart';
import '../../../../../common/resources/data_state.dart';
import '../../../../../common/widgets/dot_loading_widget.dart';
import '../../../../feature_product/data/model/category.dart';
import '../../../../feature_product/presentation/cubit/product_cubit.dart';
import '../../../../feature_product/presentation/screen/products_screen.dart';
import '../categories/category_card_item.dart';
import '../categories/category_card_vitrin_item.dart';

class vitrin_categories extends StatelessWidget {
  const vitrin_categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [];
    BlocProvider.of<ProductCubit>(context).getAllCategories();
    return BlocConsumer<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current.productStatus is GetCategoriesStatus,
      listenWhen: (previous, current) =>
          current.productStatus is GetCategoriesStatus,
      listener: (context, state) {
        if (state.productStatus is GetCategoriesStatus) {
          final status = state.productStatus as GetCategoriesStatus;
          if (status.dataState is DataSuccess) {
            final data = status.dataState as DataSuccess;
            if (data.data != null) {
              categories = data.data;
            }
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
            double cardWidth = 80;

            return Container(
              padding: const EdgeInsets.all(10),
              width: constraints.maxWidth,
              height: 150,
              color: AppColors.yadegar_1,
              child: AlignedGridView.count(
                crossAxisCount: categories.length>4?4:categories.length,
                mainAxisSpacing: 4,
                itemCount: categories.length,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return CategoryCardVitrinItem(
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
          return const SizedBox();
        }
        return (const Center(
          child: Text("Error!"),
        ));
      },
    );
  }
}
