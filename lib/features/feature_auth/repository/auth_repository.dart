
import 'package:dio/dio.dart';

import '../../../common/error/app_exception.dart';
import '../../../common/model/personnel/personnel.dart';
import '../../../common/params/login_admin_params.dart';
import '../../../common/resources/data_state.dart';
import '../../../common/utils/prefs_operator.dart';
import '../../../locator.dart';
import '../data/data_source/aouth_api_provider.dart';

class AuthRepository {
  AuthApiProvider apiProvider;

  AuthRepository({
    required this.apiProvider,
  });

  Future<DataState<Personnel>> loginAdmin(
      LoginAdminParams loginAdminParams) async {
    try {
      Response response = await apiProvider.callLoginAdmin(loginAdminParams);
      // ZikeyLogger.showLog("LoginResponse", response.toString());

      final Personnel personnel = Personnel.fromJson(response.toString());
      if (personnel.name == null || personnel.token == null) {
        return DataFailed(response.data['Token شما منقضی شده است']);
      }
      locator<PrefsOperator>().saveUserData(
          personnel.token!, personnel.name!, int.parse(personnel.code!));
      return DataSuccess(personnel);
    } on AppException catch (e) {
      //ZikeyLogger.showLog("Auth Repo Error", e.dataFailed.error.toString());
      return DataFailed(e.dataFailed.error!);
    }
  }
}
