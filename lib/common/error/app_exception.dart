
import '../resources/data_state.dart';

class AppException implements Exception {

  final DataFailed<String> dataFailed;

  AppException({required this.dataFailed});

  String getMessage() {
    return "${dataFailed.error}";
  }
}
