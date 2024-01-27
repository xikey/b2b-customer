part of 'product_cubit.dart';

@immutable
abstract class ProductStatus {}

class InitialStatus extends ProductStatus {}

class LoadingStatus extends ProductStatus {}

class GetProductsStatus extends ProductStatus {
  final DataState dataState;

  GetProductsStatus(this.dataState);
}

class GetProductsOfCategoryStatus extends ProductStatus {
  final DataState dataState;

  GetProductsOfCategoryStatus(this.dataState);
}

class GetBasketItems extends ProductStatus {
  final DataState dataState;

  GetBasketItems(this.dataState);
}

class ReloadBasketBadge extends ProductStatus {
  final int count;

  ReloadBasketBadge(this.count);
}


class GetCategoriesStatus extends ProductStatus {
  final DataState dataState;

  GetCategoriesStatus(this.dataState);
}


class SearchStatus extends ProductStatus {
  final String keySearch;

  SearchStatus(this.keySearch);
}

class Reload extends ProductStatus {}






