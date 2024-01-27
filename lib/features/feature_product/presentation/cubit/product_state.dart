part of 'product_cubit.dart';

class ProductState {
  ProductStatus productStatus;

  ProductState({required this.productStatus});

  ProductState copyWith({
    ProductStatus? newStatus,
  }) {
    return ProductState(productStatus: newStatus ?? productStatus);
  }
}
