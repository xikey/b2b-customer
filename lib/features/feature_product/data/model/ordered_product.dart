class OrderedProduct {
  int productCode;
  double orderCount;

  OrderedProduct({
    required this.productCode,
    required this.orderCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'productCode': productCode,
      'orderCount': orderCount,
    };
  }

  factory OrderedProduct.fromJson(Map<String, dynamic> json) {
    return OrderedProduct(
      productCode: json['productCode'] as int,
      orderCount: json['orderCount'] as double,
    );
  }
}
