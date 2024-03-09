import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/orders_widget.dart';

class OrdersScreenProvider extends StatelessWidget {
  static const routeName = '/orders_screen';

  const OrdersScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(locator<ProductRepository>()),
      child: const OrdersScreen(),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("سوابق سفارشات"),
      ),
      body:   OrdersWidget(

      ),
    ));
  }
}
