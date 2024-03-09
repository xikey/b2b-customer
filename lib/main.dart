import 'package:b2b_customer/features/feature_advertise/presentation/cubit/advertise_cubit.dart';
import 'package:b2b_customer/features/feature_advertise/repository/advertise_repository.dart';
import 'package:b2b_customer/features/feature_home/presentation/cubit/home_cubit.dart';
import 'package:b2b_customer/features/feature_home/presentation/screen/home_screen.dart';
import 'package:b2b_customer/features/feature_product/presentation/cubit/product_cubit.dart';
import 'package:b2b_customer/features/feature_product/presentation/screen/orders_screen.dart';
import 'package:b2b_customer/features/feature_product/presentation/screen/products_screen.dart';
import 'package:b2b_customer/features/feature_product/presentation/screen/serach_screen.dart';
import 'package:b2b_customer/features/feature_product/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/my_scroll_behavior.dart';
import 'config/my_theme.dart';
import 'config/platform_manager.dart';
import 'features/feature_auth/presentation/cubit/login_cubit.dart';
import 'features/feature_auth/presentation/screens/login_screen.dart';
import 'features/feature_auth/repository/auth_repository.dart';
import 'features/feature_intro/presentation/bloc/splash_bloc.dart';
import 'features/feature_intro/presentation/screens/splash_screen.dart';
import 'features/feature_product/presentation/screen/product_screen.dart';
import 'locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => SplashBloc()),
    BlocProvider(create: (_) => LoginCubit(locator<AuthRepository>())),
    BlocProvider(create: (_) => HomeCubit()),
    BlocProvider(create: (_) => AdvertiseCubit(locator<AdvertiseRepository>())),
    BlocProvider(create: (_) => ProductCubit(locator<ProductRepository>())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<PlatformManager>().setPlatform(context);
    return MaterialApp(
      scrollBehavior: MyScrollBehavior(),
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      initialRoute: "/",
      locale: const Locale("fa", ""),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("fa", ""),
      ],
      routes: {

        LoginScreenProvider.routeName: (context) => const LoginScreenProvider(),
        HomeScreenProvider.routeName: (context) => const HomeScreenProvider(),
        ProductsScreenProvider.routeName: (context) =>
            const ProductsScreenProvider(),
        ProductScreenProvider.routeName: (context) =>
            const ProductScreenProvider(),
        SearchScreenProvider.routeName: (context) =>
            const SearchScreenProvider(),
        OrdersScreenProvider.routeName: (context) =>
        const OrdersScreenProvider(),
      },
      debugShowCheckedModeBanner: false,
      title: 'B2B',
      home: const SplashScreenProvider(),
    );
  }
}
