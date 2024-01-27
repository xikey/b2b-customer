import 'package:dio/dio.dart';

import '../../../common/error/app_exception.dart';
import '../../../common/resources/data_state.dart';
import '../../../common/utils/logger.dart';
import '../data/data_source/product_api_provider.dart';
import '../data/model/category.dart';
import '../data/model/product.dart';
import '../data/model/saved_product_image.dart';

class ProductRepository {
  ProductApiProvider apiProvider;

  ProductRepository({
    required this.apiProvider,
  });

  Future<DataState<List<Product>>> getAllProducts(String token) async {
    try {
      Response response = await apiProvider.callGetAllProducts(token);

      //  ZikeyLogger.showLog("Customers Response", response.toString());
      final products = Product.fromList(response.data as List);

      return DataSuccess(products);
    } on AppException catch (e) {
      return DataFailed(e.dataFailed.error!);
    }
  }

  Future<DataState<List<Product>>> getAllProductsOfCategory(
      String token, int categoryID) async {
    try {
      Response response =
          await apiProvider.callGetAllProductsOfCategory(token, categoryID);

      //  ZikeyLogger.showLog("Customers Response", response.toString());
      final products = Product.fromList(response.data as List);

      return DataSuccess(products);
    } on AppException catch (e) {
      return DataFailed(e.dataFailed.error!);
    }
  }

  Future<DataState<List<Product>>> getAllNewProducts(String token) async {
    try {
      Response response = await apiProvider.callGetAllNewProducts(token);

      final products = Product.fromList(response.data as List);
      // ZikeyLogger.showLog("products Response", products.toString());
      return DataSuccess(products);
    } on AppException catch (e) {
      // ZikeyLogger.showLog("products Response", e.toString());
      return DataFailed(e.dataFailed.error!);
    }
  }

  Future<DataState<List<Product>>> getAllSpecialProducts(String token) async {
    try {
      Response response = await apiProvider.callGetAllSpecialProducts(token);

      final products = Product.fromList(response.data as List);
      // ZikeyLogger.showLog("products Response", products.toString());
      return DataSuccess(products);
    } on AppException catch (e) {
      // ZikeyLogger.showLog("products Response", e.toString());
      return DataFailed(e.dataFailed.error!);
    }
  }

  Future<DataState<List<Category>>> getAllCategories(String token) async {
    try {
      Response response = await apiProvider.callGetCategories(token);

      final categories = Category.fromList(response.data as List);
      // ZikeyLogger.showLog("products Response", products.toString());
      return DataSuccess(categories);
    } on AppException catch (e) {
      // ZikeyLogger.showLog("products Response", e.toString());
      return DataFailed(e.dataFailed.error!);
    }
  }
}
