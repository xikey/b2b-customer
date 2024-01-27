class OrderedProduct {
  int productId;
  double orderCount;

  OrderedProduct({
    required this.productId,
    required this.orderCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'orderCount': orderCount,
    };
  }

  factory OrderedProduct.fromJson(Map<String, dynamic> json) {
    return OrderedProduct(
      productId: json['productId'] as int,
      orderCount: json['orderCount'] as double,
    );
  }
}
