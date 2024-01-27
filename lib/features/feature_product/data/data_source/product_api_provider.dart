import 'package:dio/dio.dart';

import '../../../../common/error/check_exceptions.dart';

import '../../../../common/utils/logger.dart';
import '../../../../config/constants.dart';

class ProductApiProvider {
  Dio dio;

  ProductApiProvider({
    required this.dio,
  });

  dynamic callGetAllProductsOfCategory(String token, int categoryID) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio.get(
        "${Constants.baseUrl}/product/getAllCategoryProducts",
        options: options,
        queryParameters: {
          'categoryID': categoryID,
        },
      );
      //
      // ZikeyLogger.showLog(
      //     "Product Api Provider ", response.toString());

      return response;
    } on DioException catch (e) {
      // ZikeyLogger.showLog(
      //     "Advertise Api Provider Errors", e.response.toString());
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callGetAllProducts(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio.get("${Constants.baseUrl}/product/getAll",
          options: options);
      //
      // ZikeyLogger.showLog(
      //     "Product Api Provider ", response.toString());

      return response;
    } on DioException catch (e) {
      // ZikeyLogger.showLog(
      //     "Advertise Api Provider Errors", e.response.toString());
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callGetAllNewProducts(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio
          .get("${Constants.baseUrl}/product/getNewProducts", options: options);

      return response;
    } on DioException catch (e) {
      // ZikeyLogger.showLog(
      //     "Add new product Api Provider Erros", e.response.toString());
      // ZikeyLogger.showLog("Customer Api Provider Erros", e.toString());
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callGetAllSpecialProducts(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio.get(
          "${Constants.baseUrl}/product/getSpecialProducts",
          options: options);

      return response;
    } on DioException catch (e) {
      // ZikeyLogger.showLog(
      //     "Add Special product Api Provider Erros", e.response.toString());
      // ZikeyLogger.showLog("Customer Api Provider Erros", e.toString());
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callGetCategories(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio
          .get("${Constants.baseUrl}/product/getCategories", options: options);

      ZikeyLogger.showLog("categories response", response.toString());

      return response;
    } on DioException catch (e) {
      ZikeyLogger.showLog(
          "Add new product Api Provider Erros", e.response.toString());
      ZikeyLogger.showLog("Customer Api Provider Erros", e.toString());
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }
}
