import 'dart:html';

import 'package:b2b_customer/common/utils/basket.dart';
import 'package:b2b_customer/common/utils/logger.dart';
import 'package:b2b_customer/features/feature_product/data/model/basket_item.dart';
import 'package:b2b_customer/features/feature_product/data/model/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../common/resources/data_state.dart';
import '../../../../common/utils/prefs_operator.dart';
import '../../../../locator.dart';
import '../../data/model/ordered_product.dart';
import '../../repository/product_repository.dart';

part 'product_state.dart';

part 'product_status.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepository productRepository;

  ProductCubit(
    this.productRepository,
  ) : super(ProductState(productStatus: InitialStatus()));

  void getAllProducts({String? keySearch}) async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState = await productRepository.getAllProducts(token,null,keySearch: keySearch);

    emit(state.copyWith(newStatus: GetProductsStatus(dataState)));
  }

  void getAllProductsOfCategory(int categoryID) async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState =
        await productRepository.getAllProductsOfCategory(token, categoryID);

    emit(state.copyWith(newStatus: GetProductsOfCategoryStatus(dataState)));
  }

  void search(String keySearch) async {
    emit(state.copyWith(newStatus: LoadingStatus()));
    emit(state.copyWith(newStatus: SearchStatus(keySearch)));
  }

  void getBasketProducts() async {
    emit(state.copyWith(newStatus: LoadingStatus()));
    final token = await locator<PrefsOperator>().getUserToken();
    final List<OrderedProduct> list = locator<Basket>().getBasketItems();

    List<BasketItem> basketItems = [];
    if (list.isNotEmpty) {
      String ids = "";
      for (int i = 0; i < list.length; i++) {
        if (i == 0) {
          ids += list[i].productId.toString();
        } else {
          ids += ",${list[i].productId}";
        }
      }
      final DataState dataState =
          await productRepository.getAllProducts(token, ids);


      if (dataState is DataSuccess<List<Product>>) {
        if (dataState.data != null && dataState.data!.isNotEmpty) {
          final products = dataState.data!;
          for (int i = 0; i < list.length; i++) {
            final orderedProduct = list[i];
            for (int j = 0; j < products.length; j++) {
              final product = products[j];

              if (orderedProduct.productId == product.id) {

                basketItems.add(BasketItem(
                    product: product, orderCount: orderedProduct.orderCount));
                break;
              }
            }
          }
        }
      }
    }

    emit(state.copyWith(newStatus: GetBasketItems(DataSuccess(basketItems))));
  }

  void reloadBasketBudge() async {
    emit(state.copyWith(newStatus: LoadingStatus()));
    final list = locator<Basket>().getBasketItems();
    emit(state.copyWith(newStatus: ReloadBasketBadge(list.length)));
  }

  void getAllNewProducts() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState =
        await productRepository.getAllNewProducts(token);

    emit(state.copyWith(newStatus: GetNewProductsStatus(dataState)));
  }

  void getAllSpecialProducts() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState =
        await productRepository.getAllSpecialProducts(token);

    emit(state.copyWith(newStatus: GetSpecialProductsStatus(dataState)));
  }

  void getAllCategories() async {
    final token = await locator<PrefsOperator>().getUserToken();
    emit(state.copyWith(newStatus: LoadingStatus()));
    final DataState dataState = await productRepository.getAllCategories(token);

    emit(state.copyWith(newStatus: GetCategoriesStatus(dataState)));
  }
}
