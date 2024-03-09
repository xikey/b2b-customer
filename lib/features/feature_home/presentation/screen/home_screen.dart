import 'package:b2b_customer/common/widgets/app_background.dart';
import 'package:b2b_customer/config/colors.dart';
import 'package:b2b_customer/features/feature_advertise/presentation/cubit/advertise_cubit.dart';
import 'package:b2b_customer/features/feature_advertise/repository/advertise_repository.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/presentation/screen/orders_screen.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature_product/presentation/screen/serach_screen.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_widget.dart';

class HomeScreenProvider extends StatelessWidget {
  static const routeName = '/home_screen';

  const HomeScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => HomeCubit(),
      ),
      BlocProvider(
        create: (context) => AdvertiseCubit(locator<AdvertiseRepository>()),
      ),
      BlocProvider(
        create: (context) => ProductCubit(locator<ProductRepository>()),
      ),
    ], child: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<HomeCubit>(context).loadMemberData();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('یادگار پخش'),
            backgroundColor: AppColors.yadegar_1,
            actions: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(SearchScreenProvider.routeName)
                        .then((value) {
                      BlocProvider.of<ProductCubit>(context)
                          .reloadBasketBudge();

                      BlocProvider.of<HomeCubit>(context).changeBottomNav(0);
                    });
                  },
                  icon: const Icon(Icons.search_rounded),
                  label: const Text('جستجو در یادگار'),
                ),
              )
            ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person_rounded,
                        size: 50,
                        color: Colors.lightGreen,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "محسن هادی زاده",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13,
                          fontFamily: 'Estedad',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('سوابق سفارشات'),
                leading: Icon(Icons.receipt_rounded),
                onTap: () {

                  Navigator.of(context).pushNamed(OrdersScreenProvider.routeName);

                },
              ),
              // ListTile(
              //   title: const Text('Item 2'),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
            ],
          ),
        ),
        body: Container(
          decoration: ZikeyAppBackground.homeBackgroundDecoration,
          child: const HomeWidget(),
        ),
      ),
    );
  }
}
