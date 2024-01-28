import 'package:b2b_customer/config/colors.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/params/login_admin_params.dart';
import '../../../../common/utils/validators.dart';
import '../../../../common/widgets/colorful_background_widget.dart';
import '../cubit/login_cubit.dart';
import 'login_details_widget.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget(
      {super.key,
      required this.adminUserController,
      required this.adminPassController});

  final TextEditingController adminUserController;
  final TextEditingController adminPassController;
  final _formKey = GlobalKey<FormState>();

  Future<void> _saveForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final params = LoginAdminParams(
          pass: adminPassController.value.text,
          user: adminUserController.value.text,
          ip: '0.0.0.0');
      BlocProvider.of<LoginCubit>(context).loginAdmin(params);
    } catch (e) {
      // ZikeyLogger.showLog("Login Admin Widget", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ColorfulBackgroundWidget(),
        const Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Developer: mohsen.xiv@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DelayedWidget(
          delayDuration: const Duration(milliseconds: 200),
          animationDuration: const Duration(milliseconds: 1000),
          animation: DelayedAnimations.SLIDE_FROM_LEFT,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white.withOpacity(0.9),
                      padding: const EdgeInsets.only(
                          left: 80, right: 80, top: 40, bottom: 40),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/img_yadegar_text_english_colored_small.png',
                                      width: 200,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      'خرید بدون واسطه',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: adminUserController,
                                        keyboardType: TextInputType.number,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.person_rounded,
                                            color: Colors.black54,
                                          ),
                                          hintTextDirection: TextDirection.rtl,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusColor: Colors.white,
                                          labelText: 'کد کاربری',
                                        ),
                                        validator: (value) {
                                          return Validator.userValidator(value);
                                        },
                                        autofocus: false,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: adminPassController,
                                        obscureText: true,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.vpn_key_rounded,
                                            color: Colors.black54,
                                          ),
                                          hintTextDirection: TextDirection.rtl,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          labelText: 'رمز عبور',
                                        ),
                                        validator: (value) {
                                          return Validator.passwordValidator(
                                              value);
                                        },
                                        autofocus: false,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          _saveForm(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          fixedSize:
                                              const Size(double.infinity, 50),
                                          primary: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'ورود',
                                          style: TextStyle(
                                              fontFamily: 'Estedad',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible:constraints.maxWidth>800,
                      child: Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: AppColors.yadegar_1,
                            child: LoginDetailWidget(),
                          )))
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
