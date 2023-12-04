
import 'package:dio/dio.dart';

import '../../../common/error/app_exception.dart';

import '../../../common/resources/data_state.dart';
import '../data/data_source/advertise_api_provider.dart';
import '../data/model/advertise.dart';

class AdvertiseRepository {
  AdvertiseApiProvider apiProvider;

  AdvertiseRepository({
    required this.apiProvider,
  });

  Future<DataState<List<Advertise>>> getAllAdvertises(String token) async {
    try {
      Response response = await apiProvider.callGetAllAdvertises(token);

      //  ZikeyLogger.showLog("Customers Response", response.toString());
      final advertises = Advertise.fromList(response.data as List);

      return DataSuccess(advertises);
    } on AppException catch (e) {
      return DataFailed(e.dataFailed.error!);
    }
  }


}
