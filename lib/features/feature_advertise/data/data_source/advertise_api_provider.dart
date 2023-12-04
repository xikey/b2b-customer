
import 'package:dio/dio.dart';

import '../../../../common/error/check_exceptions.dart';

import '../../../../config/constants.dart';

class AdvertiseApiProvider {
  Dio dio;

  AdvertiseApiProvider({
    required this.dio,
  });

  dynamic callGetAllAdvertises(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio.get("${Constants.baseUrl}/advertise/getAll",
          options: options);
      //
      // ZikeyLogger.showLog(
      //     "Advertise Api Provider ", response.toString());

      return response;
    } on DioError catch (e) {
      // ZikeyLogger.showLog(
      //     "Advertise Api Provider Errors", e.response.toString());
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }



}
