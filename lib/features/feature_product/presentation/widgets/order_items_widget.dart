import 'package:b2b_customer/features/feature_product/data/model/order_history_item.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../common/resources/data_state.dart';
import '../../../../common/utils/toasty.dart';
import '../../../../common/widgets/dot_loading_widget.dart';
import '../../../../config/colors.dart';
import '../cubit/product_cubit.dart';
import 'order_item_card_widget.dart';

class OrderItemsWidget extends StatelessWidget {
  OrderItemsWidget({Key? key, required this.orderId}) : super(key: key);
  final int orderId;

  List<OrderHistoryItem> orders = [];

  @override
  Widget build(BuildContext buildContext) {
    BlocProvider.of<ProductCubit>(buildContext).getOrderItems(orderId);

    return BlocConsumer<ProductCubit, ProductState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        //
        if (state.productStatus is GetOrderItemsStatus) {
          final status = state.productStatus as GetOrderItemsStatus;
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
                  return OrderItemCardWidget(item: orders[index],width: constraints.maxWidth-20,);
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
