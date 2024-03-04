import 'package:b2b_customer/features/feature_product/data/model/payment_type.dart';

import 'basket_item.dart';

class Order {
  List<BasketItem> orderedProducts;
  String uuid;
  String? comment;
  PaymentType paymentType;
  int totalPrice;

  Order({
    required this.orderedProducts,
    required this.uuid,
    required this.comment,
    required this.paymentType,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderedProducts': orderedProducts.map((orderedProduct) => orderedProduct.toJson()).toList(),
      'uuid': uuid,
      'comment': comment,
      'paymentType': paymentType,
      'totalPrice': totalPrice,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderedProducts: (json['orderedProducts'] as List<dynamic>)
          .map((item) => BasketItem.fromJson(item))
          .toList(),
      uuid: json['uuid'],
      comment: json['comment'],
      paymentType: json['paymentType'],
      totalPrice: json['totalPrice'],
    );
  }
}