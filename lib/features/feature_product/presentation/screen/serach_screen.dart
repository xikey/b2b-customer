import 'package:b2b_customer/common/params/args/products_screen_args.dart';
import 'package:b2b_customer/features/feature_product/data/model/category.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/presentation/widgets/products_widget.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/zikey_search_view.dart';
import '../widgets/search_screen_widget.dart';

class SearchScreenProvider extends StatelessWidget {
  static const routeName = '/search_screen';

  const SearchScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(locator<ProductRepository>()),
      child: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: ZikeySearchAppBarView(
          searchOnStart: true,
          title: 'محصولات',
          onTextChanged: (text) {},
          onClosed: () {
            Navigator.of(context).pop();
          },
          onSubmit: (text) {
            BlocProvider.of<ProductCubit>(context)
                .getAllProducts(keySearch: text);
          },
        ),
      ),
      body: const SearchScreenWidget(),
    ));
  }
}
