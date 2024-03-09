import 'package:b2b_customer/common/widgets/add_to_basket_widget.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/order_card_widget.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../common/params/args/product_screen_args.dart';
import '../../../../common/resources/data_state.dart';
import '../../../../common/utils/toasty.dart';
import '../../../../common/widgets/dot_loading_widget.dart';
import '../../../../config/colors.dart';
import '../../data/model/order_history.dart';
import '../cubit/product_cubit.dart';

class OrdersWidget extends StatelessWidget {
  OrdersWidget({Key? key}) : super(key: key);

  List<OrderHistory> orders = [];

  @override
  Widget build(BuildContext buildContext) {
    BlocProvider.of<ProductCubit>(buildContext).getOrders();

    return BlocConsumer<ProductCubit, ProductState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        //
        if (state.productStatus is GetOrdersStatus) {
          final status = state.productStatus as GetOrdersStatus;
          if (status.dataState is DataSuccess) {
            final data = status.dataState as DataSuccess;
            if (data.data != null) {
              orders = data.data;
            }
          } else {
            ZikeyToast()
                .showSnackBarError(context, "خطا در دریافت اطلاعات  محصولات");
          }
        }

        if (state.productStatus is SearchStatus) {
          // final status = state.productStatus as SearchStatus;
          // keySearch = status.keySearch;
        }
      },
      builder: (context, state) {
        if (state.productStatus is LoadingStatus) {
          return const DotLoadingWidget(size: 40);
        }

        if (orders.isNotEmpty) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {

            double pageWidth = constraints.maxWidth;



            return Container(
              padding: const EdgeInsets.all(10),
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: AppColors.appGrey,
              child: AlignedGridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 1,
                itemCount: orders.length,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return OrderCardWidget(
                      orderHistory: orders[index],
                      onTap: () {},
                      rowNum: index + 1);
                },
              ),
            );
          });
        } else {
          return (const Center(
            child: Text(" سفارشی یافت نشد"),
          ));
        }
      },
    );
  }
}
