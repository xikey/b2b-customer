import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../common/widgets/app_background.dart';
import '../../../feature_auth/presentation/screens/login_screen.dart';
import '../bloc/splash_bloc.dart';
import 'package:gif_view/gif_view.dart';

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

class SpashScreen extends StatefulWidget {
  SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen>
    with TickerProviderStateMixin {
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
                delayDuration: const Duration(milliseconds: 1),
                animationDuration: const Duration(milliseconds: 1),
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                child:  GifView.asset(
                  'assets/images/yadegar_animated_logo.gif',
                  height: 200,
                  width: 200,
                  frameRate: 15, // default is 15 FPS
                ),

                // ),  child: GifImage(
                //   controller: controller,
                //   image: AssetImage("assets/images/yadegar_animated_logo.gif"),
                // ),
              ),
            ),
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
