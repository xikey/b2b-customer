import 'package:dio/dio.dart';

import '../../../../common/error/check_exceptions.dart';

import '../../../../common/utils/logger.dart';
import '../../../../config/constants.dart';
import '../model/order.dart';

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

  dynamic callGetAllProducts(String token, String? productIds,
      {String? keySearch}) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );

      // Create an empty map for query parameters
      Map<String, dynamic> queryParameters = {};

      // Add 'productsID' to the queryParameters if productIds is not null
      if (productIds != null) {
        queryParameters['productsID'] = productIds;
      }

      // Add 'keySearch' to the queryParameters if keySearch is not null
      if (keySearch != null) {
        queryParameters['keySearch'] = keySearch;
      }

      final response = await dio.get(
        "${Constants.baseUrl}/product/getAll",
        options: options,
        queryParameters: queryParameters,
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

      return response;
    } on DioException catch (e) {
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callGetPaymentTypes(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio.get(
          "${Constants.baseUrl}/product/getPaymentTypes",
          options: options);

      return response;
    } on DioException catch (e) {
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callAddOrder(String token, Order order) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json', // Specify the content type as JSON
        },
      );
      final response = await dio.post("${Constants.baseUrl}/product/addOrder",
          options: options, data: order);

      ZikeyLogger.showLog("NEW ORDER RESPONSE", response.toString());
      return response;
    } on DioException catch (e) {
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }

  dynamic callGetOrders(String token) async {
    try {
      final options = Options(
        headers: {
          'Authorization': 'Bearer ${token}',
        },
      );
      final response = await dio.get(
          "${Constants.baseUrl}/product/getOrdersHeader",
          options: options);

      return response;
    } on DioException catch (e) {
      final error = await ZikeyErrorHandler.getError(e.response);
      throw error;
    }
  }
}
