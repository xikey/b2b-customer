import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/order_items_widget.dart';
import '../widgets/orders_widget.dart';

class OrderItemsScreenProvider extends StatelessWidget {
  static const routeName = '/order_items_screen';

  const OrderItemsScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderID = ModalRoute.of(context)?.settings.arguments as int;
    return BlocProvider(
      create: (context) => ProductCubit(locator<ProductRepository>()),
      child: OrderItemsScreen(
        orderID: orderID,
      ),
    );
  }
}

class OrderItemsScreen extends StatelessWidget {
  const OrderItemsScreen({Key? key, required this.orderID}) : super(key: key);

  final int orderID;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("اقلام سفارش"),
      ),
      body: OrderItemsWidget(orderId: orderID,),
    ));
  }
}
