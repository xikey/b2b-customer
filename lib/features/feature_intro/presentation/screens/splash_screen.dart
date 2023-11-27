import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../common/widgets/app_background.dart';
import '../../../feature_auth/presentation/screens/login_screen.dart';
import '../bloc/splash_bloc.dart';

class SplashScreenProvider extends StatelessWidget {
  const SplashScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: SpashScreen(),
    );
  }
}

class SpashScreen extends StatelessWidget {
  SpashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(CheckConnectionEvent());
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: ZikeyAppBackground.splashBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: DelayedWidget(
                    delayDuration: const Duration(milliseconds: 200),
                    animationDuration: const Duration(milliseconds: 2000),
                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                    child: Image.asset(
                      'assets/images/img_yadegar_text_farsi_white.png',
                      width: 250,
                    ))),
            BlocConsumer<SplashBloc, SplashState>(
              listenWhen: (previous, current) {
                return previous != current;
              },
              buildWhen: (previous, current) => previous != current,
              listener: (listenerContext, state) {
                if (state.connectionsStatus is ConnectionOn) {
                  goToLogin(context);
                }
              },
              builder: (context, state) {
                /// if user is online
                if (state.connectionsStatus is ConnectionInitial ||
                    state.connectionsStatus is ConnectionOn) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: LoadingAnimationWidget.prograssiveDots(
                      color: Colors.white,
                      size: 50,
                    ),
                  );
                }

                /// if user is offline
                if (state.connectionsStatus is ConnectionOff) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'به اینترنت متصل نیستید!',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Estedad"),
                      ),
                      IconButton(
                          splashColor: Colors.red,
                          onPressed: () {
                            /// check that we are online or not
                            BlocProvider.of<SplashBloc>(context)
                                .add(CheckConnectionEvent());
                          },
                          icon: const Icon(
                            Icons.autorenew,
                            color: Colors.red,
                          ))
                    ],
                  );
                }

                /// default value
                return Container();
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToLogin(BuildContext context) async {

    return Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreenProvider.routeName,
        ModalRoute.withName("main_wrapper"),
      );
    });
  }
}
