import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/params/args/product_screen_args.dart';
import '../widgets/product_widget.dart';

class ProductScreenProvider extends StatelessWidget {
  static const routeName = '/product_screen';

  const ProductScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ProductScreenArgs;

    return BlocProvider(
      create: (context) => ProductCubit(locator<ProductRepository>()),
      child: ProductScreen(
        product: args.product,
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("معرفی محصول"),),
      body: ProductWidget(
        product: product,
      ),
    ));
  }
}
