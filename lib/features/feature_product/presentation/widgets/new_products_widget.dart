import 'package:b2b_customer/common/params/args/product_screen_args.dart';
import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/resources/data_state.dart';
import '../../../../common/widgets/add_to_basket_widget.dart';
import '../../../../common/widgets/dot_loading_widget.dart';
import '../cubit/product_cubit.dart';
import '../screen/product_screen.dart';
import 'home_product_card_item.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).getAllNewProducts();
    return BlocConsumer<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          current.productStatus is GetNewProductsStatus,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.productStatus is LoadingStatus) {
          return const DotLoadingWidget(size: 40);
        }

        if (state.productStatus is GetNewProductsStatus) {
          final status = state.productStatus as GetNewProductsStatus;
          if (status.dataState is DataSuccess) {
            final List<Product> list = status.dataState.data;
            if (list.isEmpty) {
              return const SizedBox();
            }
            return Container(
              height: 400,
              width: double.infinity,
              color: AppColors.appGrey,
              child: Center(
                child: SizedBox(
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length + 1,
                    // Replace with your actual item count
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return SizedBox(
                          height: 350,
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Opacity(
                                  opacity: 0.5,
                                  child: Image.asset(
                                    'assets/images/award_icon.png',
                                  )),
                              const Text(
                                "جدید ترین ها",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                        );
                      }
                      // Replace this with the widget you want to display in the list
                      return HomeProductCardItem(
                        height: 350,
                        addColor: Colors.blueAccent,
                        product: list[index - 1],
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProductScreenProvider.routeName,
                                  arguments: ProductScreenArgs(
                                      product: list[index - 1]))
                              .then((value) =>
                                  BlocProvider.of<ProductCubit>(context)
                                      .reloadBasketBudge());
                        },
                        addToBasket: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddToBasketDialog(
                                product: list[index - 1],
                              );
                            },
                          ).then((value) =>
                              BlocProvider.of<ProductCubit>(context)
                                  .reloadBasketBudge());
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          }
        }

        return (const SizedBox());
      },
    );
  }
}
