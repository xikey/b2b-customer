
import 'package:dio/dio.dart';
import '../resources/data_state.dart';
import 'app_exception.dart';
import 'http_exception.dart';

class ZikeyErrorHandler {
  static Future<AppException> getError(Response? response) async {
    if (response == null) {
      return AppException(
          dataFailed: DataFailed(HttpExceptionData(
              message: "متاسفانه خطایی نامشخص رخ داده است",
              statusCode: 1,
              timestamp: DateTime.now(),
              path: "")));
    }

    final errorData = response!.data;
    final httpException= HttpExceptionData.fromJson(errorData);
    

    return AppException(dataFailed: DataFailed(httpException));
  }
}
