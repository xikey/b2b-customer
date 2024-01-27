import 'package:b2b_customer/features/feature_product/data/model/product.dart';

class BasketItem {
  Product product;
  double orderCount;

  BasketItem({
    required this.product,
    required this.orderCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'orderCount': orderCount,
    };
  }

  factory BasketItem.fromJson(Map<String, dynamic> json) {
    return BasketItem(
      product: Product.fromJson(json['product']),
      orderCount: json['orderCount'] as double,
    );
  }
}
