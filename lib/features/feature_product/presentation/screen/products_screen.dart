import 'package:b2b_customer/common/params/args/products_screen_args.dart';
import 'package:b2b_customer/features/feature_product/data/model/category.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/products_widget.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/zikey_search_view.dart';

class ProductsScreenProvider extends StatelessWidget {
  static const routeName = '/products_screen';

  const ProductsScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ProductsScreenArgs;

    return BlocProvider(
      create: (context) => ProductCubit(locator<ProductRepository>()),
      child: ProductsScreen(
        category: args.category,
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: ZikeySearchAppBarView(
          title: category.name,
          onTextChanged: (text) {
            BlocProvider.of<ProductCubit>(context).search(text);
          },
          onClosed: () {
            BlocProvider.of<ProductCubit>(context).search("");
          },
        ),
      ),
      body: ProductsWidget(
        category: category,
      ),
    ));
  }
}
