// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../../../../common/error/check_exceptions.dart';
import '../../../../common/params/login_admin_params.dart';

import '../../../../config/constants.dart';

class AuthApiProvider {
  Dio dio;

  AuthApiProvider({
    required this.dio,
  });

  dynamic callLoginAdmin(LoginAdminParams loginAdminParams) async {
    try {
      final response = await dio.post("${Constants.baseUrl}/user/loginCustomer",
          data: {
            "code": loginAdminParams.user,
            "password": loginAdminParams.pass,
            "ip": "0.0.0.0"
          });

      return response;
    } on DioError catch (e) {
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }
}
