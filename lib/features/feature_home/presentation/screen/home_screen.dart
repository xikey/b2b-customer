import 'package:b2b_customer/common/widgets/app_background.dart';
import 'package:b2b_customer/features/feature_advertise/presentation/cubit/advertise_cubit.dart';
import 'package:b2b_customer/features/feature_advertise/repository/advertise_repository.dart';
import 'package:b2b_customer/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: Container(
          decoration: ZikeyAppBackground.homeBackgroundDecoration,
          child: const HomeWidget(),
        ),
      ),
    );
  }
}
