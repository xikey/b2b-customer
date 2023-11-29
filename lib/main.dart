import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/my_theme.dart';
import 'config/platform_manager.dart';
import 'features/feature_auth/presentation/cubit/login_cubit.dart';
import 'features/feature_auth/presentation/screens/login_screen.dart';
import 'features/feature_auth/repository/auth_repository.dart';
import 'features/feature_intro/presentation/bloc/splash_bloc.dart';
import 'features/feature_intro/presentation/screens/splash_screen.dart';
import 'locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => SplashBloc()),
    BlocProvider(create: (_) => LoginCubit(locator<AuthRepository>())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<PlatformManager>().setPlatform(context);
    return MaterialApp(
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

        // CategoryProfileScreenProvider.routeName: (context) =>
        // const CategoryProfileScreenProvider(),
      },
      debugShowCheckedModeBanner: false,
      title: 'B2B',
      home: const SplashScreenProvider(),
    );
  }
}
