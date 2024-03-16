import 'package:b2b_customer/features/feature_home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/resources/data_state.dart';

import '../../../../common/widgets/alert_dialog_message.dart';

import '../../../../common/widgets/dot_loading_widget.dart';
import '../../../../locator.dart';

import '../../repository/auth_repository.dart';
import '../cubit/login_cubit.dart';
import '../widgets/login_widget.dart';

class LoginScreenProvider extends StatelessWidget {
  static const routeName = '/login_screen';

  const LoginScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(locator<AuthRepository>()),
      child: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adminUserController = TextEditingController();
    final adminPassController = TextEditingController();

    return Scaffold(
      body: Container(
        child: BlocConsumer<LoginCubit, LoginState>(
          buildWhen: (previous, current) => previous != current,
          listenWhen: (previous, current) => previous != current,
          builder: (BuildContext context, state) {
            if (state.loginStatus is AdminMode ||
                state.loginStatus is LoginAdminStatus) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                child: LoginWidget(
                  adminUserController: adminUserController,
                  adminPassController: adminPassController,
                ),
              );
            } else if (state.loginStatus is LoadingStatus) {
              return const Center(
                child: DotLoadingWidget(
                  size: 40,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
          listener: (context, state) {
            // ZikeyLogger.showLog('state', state.loginStatus.toString());
            if (state.loginStatus is LoginAdminStatus) {
              final status = state.loginStatus as LoginAdminStatus;
              final data = status.dataState;
              if (data is DataFailed) {
                AlertDialogMessage()
                    .showMessage(context, 'خطا', data.error!.message);
              }
              if (data is DataSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeScreenProvider.routeName,
                  ModalRoute.withName("home"),
                );
              }
            }
            if (state.loginStatus is FailedLoadingData) {
              final status = state.loginStatus as FailedLoadingData;
              final data = status.dataFailed;
              AlertDialogMessage()
                  .showMessage(context, 'خطا', data.error.toString());
            }
          },
        ),
      ),
    );
  }
}
