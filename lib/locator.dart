import 'package:b2b_customer/features/feature_advertise/data/data_source/advertise_api_provider.dart';
import 'package:b2b_customer/features/feature_advertise/repository/advertise_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/utils/prefs_operator.dart';
import 'config/platform_manager.dart';
import 'features/feature_auth/data/data_source/aouth_api_provider.dart';
import 'features/feature_auth/repository/auth_repository.dart';
import 'features/feature_intro/repository/splash_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());

  ///Platform
  locator.registerSingleton<PlatformManager>(PlatformManager());

  ///ApiProvider
  locator
      .registerFactory<AuthApiProvider>(() => AuthApiProvider(dio: locator()));

  locator.registerFactory<AdvertiseApiProvider>(
      () => AdvertiseApiProvider(dio: locator()));

  ///Repo
  locator.registerFactory<SplashRepository>(() => SplashRepository());
  locator.registerFactory<AuthRepository>(
      () => AuthRepository(apiProvider: locator()));
  locator.registerFactory<AdvertiseRepository>(
      () => AdvertiseRepository(apiProvider: locator()));
}
